# Deep links (App Links / Universal Links)

Opens the candidate card from an external `https` link:
`https://cvscan.ae.kg/candidates/<id>` → `CandidateDetailRoute(id)`.

Routing is handled by `go_router`; the gate (`ColdStartGuard`) preserves the
target through the lock and resumes it after unlock.

## 1. Replace placeholders

- **Domain** `cvscan.ae.kg` — set a real domain you control in:
  - `android/app/src/main/AndroidManifest.xml` (`android:host`)
  - `ios/Runner/Runner.entitlements` (`applinks:`)
- **Android** `sha256_cert_fingerprints` in `.well-known/assetlinks.json` —
  get it via: `cd android && ./gradlew signingReport` (SHA-256 of the signing cert).
- **iOS** `REPLACE_APPLE_TEAM_ID` in `.well-known/apple-app-site-association` —
  your Apple Developer Team ID (e.g. `ABCDE12345`).

## 2. Host the files

Serve both over HTTPS at the domain root (no redirects, `Content-Type: application/json`):

- `https://<domain>/.well-known/assetlinks.json`
- `https://<domain>/.well-known/apple-app-site-association`

## 3. iOS one-time Xcode step

`Runner.entitlements` is created, but Xcode must link it:
Runner target → Signing & Capabilities → **+ Capability → Associated Domains** →
add `applinks:<domain>`. (This sets `CODE_SIGN_ENTITLEMENTS`.)

## 4. Test in debug

Run the app on a device/simulator, then fire a link. Both have Makefile targets
(override the id: `make deeplink-android ID=42`):

```bash
make deeplink-android ID=42   # adb am start ... https://<host>/candidates/42
make deeplink-ios     ID=42   # xcrun simctl openurl booted ...
```

### Android — fully offline, no hosting required

`am start` targets the package explicitly, so the link reaches the activity
even though `assetlinks.json` isn't hosted / verified yet:

```bash
adb shell am start -a android.intent.action.VIEW \
  -d "https://cvscan.ae.kg/candidates/42" kg.ae.cv_scan
```

Expected: cold start → lock → enter PIN → candidate card 42 (full screen).
Check verification state once hosted: `adb shell pm get-app-links kg.ae.cv_scan`.

### iOS — needs the domain association

Universal Links route to the app only if the associated domain is verified
against the AASA — `simctl openurl` alone opens Safari otherwise. To test
without public hosting, use Apple's developer mode:

1. Entitlement: `applinks:cvscan.ae.kg?mode=developer`.
2. Serve the AASA from a local HTTPS server at
   `https://cvscan.ae.kg/.well-known/apple-app-site-association`.
3. Device: Settings → Developer → enable **Associated Domains Development**.
4. Then:

```bash
xcrun simctl openurl booted "https://cvscan.ae.kg/candidates/42"
```

> Unlike Android, iOS has no "explicit package" bypass — a real (or local-dev)
> AASA association is mandatory. A custom URL scheme would be the only fully
> offline iOS path, but that's intentionally not configured here.
