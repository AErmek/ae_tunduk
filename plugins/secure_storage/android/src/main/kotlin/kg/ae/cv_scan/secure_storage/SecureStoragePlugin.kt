package kg.ae.cv_scan.secure_storage

import android.content.Context
import android.content.SharedPreferences
import android.os.Handler
import android.os.Looper
import io.flutter.embedding.engine.plugins.FlutterPlugin
import java.util.concurrent.Executors

/**
 * Keystore-backed implementation of the Pigeon [SecureStorageApi].
 *
 * Crypto and disk I/O run on a single background thread (serializing Keystore
 * access, which is not thread-safe), and every reply is posted back to the main
 * thread as the platform-channel contract requires.
 */
class SecureStoragePlugin :
    FlutterPlugin,
    SecureStorageApi {

    private lateinit var prefs: SharedPreferences
    private lateinit var cipher: KeystoreCipher

    private val worker = Executors.newSingleThreadExecutor()
    private val main = Handler(Looper.getMainLooper())

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        prefs = binding.applicationContext.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        cipher = KeystoreCipher(KEY_ALIAS)
        SecureStorageApi.setUp(binding.binaryMessenger, this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        SecureStorageApi.setUp(binding.binaryMessenger, null)
    }

    override fun read(key: String, callback: (Result<String?>) -> Unit) = dispatch(callback) {
        prefs.getString(key, null)?.let(cipher::decrypt)
    }

    override fun write(key: String, value: String, callback: (Result<Unit>) -> Unit) = dispatch(callback) {
        prefs.edit().putString(key, cipher.encrypt(value)).commit()
    }

    override fun delete(key: String, callback: (Result<Unit>) -> Unit) = dispatch(callback) {
        prefs.edit().remove(key).commit()
    }

    override fun deleteAll(callback: (Result<Unit>) -> Unit) = dispatch(callback) {
        prefs.edit().clear().commit()
    }

    override fun containsKey(key: String, callback: (Result<Boolean>) -> Unit) = dispatch(callback) {
        prefs.contains(key)
    }

    private fun <T> dispatch(callback: (Result<T>) -> Unit, action: () -> T) {
        worker.execute {
            val result = runCatching(action)
            main.post { callback(result) }
        }
    }

    private companion object {
        const val PREFS_NAME = "kg.ae.cv_scan.secure_storage"
        const val KEY_ALIAS = "cv_scan_secure_storage_master_key"
    }
}
