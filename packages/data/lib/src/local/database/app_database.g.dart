// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CandidatesTableTable extends CandidatesTable
    with TableInfo<$CandidatesTableTable, CandidatesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CandidatesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<String> position = GeneratedColumn<String>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _posLabelMeta = const VerificationMeta(
    'posLabel',
  );
  @override
  late final GeneratedColumn<String> posLabel = GeneratedColumn<String>(
    'pos_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _verdictMeta = const VerificationMeta(
    'verdict',
  );
  @override
  late final GeneratedColumn<String> verdict = GeneratedColumn<String>(
    'verdict',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _vcMeta = const VerificationMeta('vc');
  @override
  late final GeneratedColumn<String> vc = GeneratedColumn<String>(
    'vc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileMeta = const VerificationMeta('file');
  @override
  late final GeneratedColumn<String> file = GeneratedColumn<String>(
    'file',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tgMeta = const VerificationMeta('tg');
  @override
  late final GeneratedColumn<String> tg = GeneratedColumn<String>(
    'tg',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _expMeta = const VerificationMeta('exp');
  @override
  late final GeneratedColumn<String> exp = GeneratedColumn<String>(
    'exp',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalExpMeta = const VerificationMeta(
    'totalExp',
  );
  @override
  late final GeneratedColumn<String> totalExp = GeneratedColumn<String>(
    'total_exp',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stackMeta = const VerificationMeta('stack');
  @override
  late final GeneratedColumn<String> stack = GeneratedColumn<String>(
    'stack',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _eduMeta = const VerificationMeta('edu');
  @override
  late final GeneratedColumn<String> edu = GeneratedColumn<String>(
    'edu',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _criteriaMeta = const VerificationMeta(
    'criteria',
  );
  @override
  late final GeneratedColumn<String> criteria = GeneratedColumn<String>(
    'criteria',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _summaryMeta = const VerificationMeta(
    'summary',
  );
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _questionsMeta = const VerificationMeta(
    'questions',
  );
  @override
  late final GeneratedColumn<String> questions = GeneratedColumn<String>(
    'questions',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateAddedMeta = const VerificationMeta(
    'dateAdded',
  );
  @override
  late final GeneratedColumn<DateTime> dateAdded = GeneratedColumn<DateTime>(
    'date_added',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _searchIndexMeta = const VerificationMeta(
    'searchIndex',
  );
  @override
  late final GeneratedColumn<String> searchIndex = GeneratedColumn<String>(
    'search_index',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    position,
    posLabel,
    verdict,
    vc,
    status,
    version,
    file,
    email,
    phone,
    city,
    tg,
    exp,
    totalExp,
    stack,
    edu,
    criteria,
    summary,
    questions,
    note,
    dateAdded,
    searchIndex,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'candidates';
  @override
  VerificationContext validateIntegrity(
    Insertable<CandidatesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('pos_label')) {
      context.handle(
        _posLabelMeta,
        posLabel.isAcceptableOrUnknown(data['pos_label']!, _posLabelMeta),
      );
    } else if (isInserting) {
      context.missing(_posLabelMeta);
    }
    if (data.containsKey('verdict')) {
      context.handle(
        _verdictMeta,
        verdict.isAcceptableOrUnknown(data['verdict']!, _verdictMeta),
      );
    } else if (isInserting) {
      context.missing(_verdictMeta);
    }
    if (data.containsKey('vc')) {
      context.handle(_vcMeta, vc.isAcceptableOrUnknown(data['vc']!, _vcMeta));
    } else if (isInserting) {
      context.missing(_vcMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('file')) {
      context.handle(
        _fileMeta,
        file.isAcceptableOrUnknown(data['file']!, _fileMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('tg')) {
      context.handle(_tgMeta, tg.isAcceptableOrUnknown(data['tg']!, _tgMeta));
    }
    if (data.containsKey('exp')) {
      context.handle(
        _expMeta,
        exp.isAcceptableOrUnknown(data['exp']!, _expMeta),
      );
    }
    if (data.containsKey('total_exp')) {
      context.handle(
        _totalExpMeta,
        totalExp.isAcceptableOrUnknown(data['total_exp']!, _totalExpMeta),
      );
    }
    if (data.containsKey('stack')) {
      context.handle(
        _stackMeta,
        stack.isAcceptableOrUnknown(data['stack']!, _stackMeta),
      );
    }
    if (data.containsKey('edu')) {
      context.handle(
        _eduMeta,
        edu.isAcceptableOrUnknown(data['edu']!, _eduMeta),
      );
    }
    if (data.containsKey('criteria')) {
      context.handle(
        _criteriaMeta,
        criteria.isAcceptableOrUnknown(data['criteria']!, _criteriaMeta),
      );
    }
    if (data.containsKey('summary')) {
      context.handle(
        _summaryMeta,
        summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta),
      );
    }
    if (data.containsKey('questions')) {
      context.handle(
        _questionsMeta,
        questions.isAcceptableOrUnknown(data['questions']!, _questionsMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('date_added')) {
      context.handle(
        _dateAddedMeta,
        dateAdded.isAcceptableOrUnknown(data['date_added']!, _dateAddedMeta),
      );
    }
    if (data.containsKey('search_index')) {
      context.handle(
        _searchIndexMeta,
        searchIndex.isAcceptableOrUnknown(
          data['search_index']!,
          _searchIndexMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CandidatesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CandidatesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}position'],
      )!,
      posLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pos_label'],
      )!,
      verdict: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}verdict'],
      )!,
      vc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vc'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      file: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      tg: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tg'],
      ),
      exp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exp'],
      ),
      totalExp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}total_exp'],
      ),
      stack: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stack'],
      ),
      edu: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}edu'],
      ),
      criteria: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}criteria'],
      ),
      summary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}summary'],
      ),
      questions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}questions'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      dateAdded: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_added'],
      ),
      searchIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}search_index'],
      )!,
    );
  }

  @override
  $CandidatesTableTable createAlias(String alias) {
    return $CandidatesTableTable(attachedDatabase, alias);
  }
}

class CandidatesTableData extends DataClass
    implements Insertable<CandidatesTableData> {
  final String id;
  final String name;
  final String position;
  final String posLabel;
  final String verdict;
  final String vc;
  final String status;
  final int version;
  final String? file;
  final String? email;
  final String? phone;
  final String? city;
  final String? tg;
  final String? exp;
  final String? totalExp;
  final String? stack;
  final String? edu;
  final String? criteria;
  final String? summary;
  final String? questions;
  final String? note;
  final DateTime? dateAdded;

  /// Lowercased name + position for Unicode-aware, case-insensitive search
  /// (SQLite LIKE only folds ASCII; names are Cyrillic). Filled in Dart.
  final String searchIndex;
  const CandidatesTableData({
    required this.id,
    required this.name,
    required this.position,
    required this.posLabel,
    required this.verdict,
    required this.vc,
    required this.status,
    required this.version,
    this.file,
    this.email,
    this.phone,
    this.city,
    this.tg,
    this.exp,
    this.totalExp,
    this.stack,
    this.edu,
    this.criteria,
    this.summary,
    this.questions,
    this.note,
    this.dateAdded,
    required this.searchIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['position'] = Variable<String>(position);
    map['pos_label'] = Variable<String>(posLabel);
    map['verdict'] = Variable<String>(verdict);
    map['vc'] = Variable<String>(vc);
    map['status'] = Variable<String>(status);
    map['version'] = Variable<int>(version);
    if (!nullToAbsent || file != null) {
      map['file'] = Variable<String>(file);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || tg != null) {
      map['tg'] = Variable<String>(tg);
    }
    if (!nullToAbsent || exp != null) {
      map['exp'] = Variable<String>(exp);
    }
    if (!nullToAbsent || totalExp != null) {
      map['total_exp'] = Variable<String>(totalExp);
    }
    if (!nullToAbsent || stack != null) {
      map['stack'] = Variable<String>(stack);
    }
    if (!nullToAbsent || edu != null) {
      map['edu'] = Variable<String>(edu);
    }
    if (!nullToAbsent || criteria != null) {
      map['criteria'] = Variable<String>(criteria);
    }
    if (!nullToAbsent || summary != null) {
      map['summary'] = Variable<String>(summary);
    }
    if (!nullToAbsent || questions != null) {
      map['questions'] = Variable<String>(questions);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || dateAdded != null) {
      map['date_added'] = Variable<DateTime>(dateAdded);
    }
    map['search_index'] = Variable<String>(searchIndex);
    return map;
  }

  CandidatesTableCompanion toCompanion(bool nullToAbsent) {
    return CandidatesTableCompanion(
      id: Value(id),
      name: Value(name),
      position: Value(position),
      posLabel: Value(posLabel),
      verdict: Value(verdict),
      vc: Value(vc),
      status: Value(status),
      version: Value(version),
      file: file == null && nullToAbsent ? const Value.absent() : Value(file),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      tg: tg == null && nullToAbsent ? const Value.absent() : Value(tg),
      exp: exp == null && nullToAbsent ? const Value.absent() : Value(exp),
      totalExp: totalExp == null && nullToAbsent
          ? const Value.absent()
          : Value(totalExp),
      stack: stack == null && nullToAbsent
          ? const Value.absent()
          : Value(stack),
      edu: edu == null && nullToAbsent ? const Value.absent() : Value(edu),
      criteria: criteria == null && nullToAbsent
          ? const Value.absent()
          : Value(criteria),
      summary: summary == null && nullToAbsent
          ? const Value.absent()
          : Value(summary),
      questions: questions == null && nullToAbsent
          ? const Value.absent()
          : Value(questions),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      dateAdded: dateAdded == null && nullToAbsent
          ? const Value.absent()
          : Value(dateAdded),
      searchIndex: Value(searchIndex),
    );
  }

  factory CandidatesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CandidatesTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      position: serializer.fromJson<String>(json['position']),
      posLabel: serializer.fromJson<String>(json['posLabel']),
      verdict: serializer.fromJson<String>(json['verdict']),
      vc: serializer.fromJson<String>(json['vc']),
      status: serializer.fromJson<String>(json['status']),
      version: serializer.fromJson<int>(json['version']),
      file: serializer.fromJson<String?>(json['file']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      city: serializer.fromJson<String?>(json['city']),
      tg: serializer.fromJson<String?>(json['tg']),
      exp: serializer.fromJson<String?>(json['exp']),
      totalExp: serializer.fromJson<String?>(json['totalExp']),
      stack: serializer.fromJson<String?>(json['stack']),
      edu: serializer.fromJson<String?>(json['edu']),
      criteria: serializer.fromJson<String?>(json['criteria']),
      summary: serializer.fromJson<String?>(json['summary']),
      questions: serializer.fromJson<String?>(json['questions']),
      note: serializer.fromJson<String?>(json['note']),
      dateAdded: serializer.fromJson<DateTime?>(json['dateAdded']),
      searchIndex: serializer.fromJson<String>(json['searchIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'position': serializer.toJson<String>(position),
      'posLabel': serializer.toJson<String>(posLabel),
      'verdict': serializer.toJson<String>(verdict),
      'vc': serializer.toJson<String>(vc),
      'status': serializer.toJson<String>(status),
      'version': serializer.toJson<int>(version),
      'file': serializer.toJson<String?>(file),
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
      'city': serializer.toJson<String?>(city),
      'tg': serializer.toJson<String?>(tg),
      'exp': serializer.toJson<String?>(exp),
      'totalExp': serializer.toJson<String?>(totalExp),
      'stack': serializer.toJson<String?>(stack),
      'edu': serializer.toJson<String?>(edu),
      'criteria': serializer.toJson<String?>(criteria),
      'summary': serializer.toJson<String?>(summary),
      'questions': serializer.toJson<String?>(questions),
      'note': serializer.toJson<String?>(note),
      'dateAdded': serializer.toJson<DateTime?>(dateAdded),
      'searchIndex': serializer.toJson<String>(searchIndex),
    };
  }

  CandidatesTableData copyWith({
    String? id,
    String? name,
    String? position,
    String? posLabel,
    String? verdict,
    String? vc,
    String? status,
    int? version,
    Value<String?> file = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> city = const Value.absent(),
    Value<String?> tg = const Value.absent(),
    Value<String?> exp = const Value.absent(),
    Value<String?> totalExp = const Value.absent(),
    Value<String?> stack = const Value.absent(),
    Value<String?> edu = const Value.absent(),
    Value<String?> criteria = const Value.absent(),
    Value<String?> summary = const Value.absent(),
    Value<String?> questions = const Value.absent(),
    Value<String?> note = const Value.absent(),
    Value<DateTime?> dateAdded = const Value.absent(),
    String? searchIndex,
  }) => CandidatesTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    position: position ?? this.position,
    posLabel: posLabel ?? this.posLabel,
    verdict: verdict ?? this.verdict,
    vc: vc ?? this.vc,
    status: status ?? this.status,
    version: version ?? this.version,
    file: file.present ? file.value : this.file,
    email: email.present ? email.value : this.email,
    phone: phone.present ? phone.value : this.phone,
    city: city.present ? city.value : this.city,
    tg: tg.present ? tg.value : this.tg,
    exp: exp.present ? exp.value : this.exp,
    totalExp: totalExp.present ? totalExp.value : this.totalExp,
    stack: stack.present ? stack.value : this.stack,
    edu: edu.present ? edu.value : this.edu,
    criteria: criteria.present ? criteria.value : this.criteria,
    summary: summary.present ? summary.value : this.summary,
    questions: questions.present ? questions.value : this.questions,
    note: note.present ? note.value : this.note,
    dateAdded: dateAdded.present ? dateAdded.value : this.dateAdded,
    searchIndex: searchIndex ?? this.searchIndex,
  );
  CandidatesTableData copyWithCompanion(CandidatesTableCompanion data) {
    return CandidatesTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      position: data.position.present ? data.position.value : this.position,
      posLabel: data.posLabel.present ? data.posLabel.value : this.posLabel,
      verdict: data.verdict.present ? data.verdict.value : this.verdict,
      vc: data.vc.present ? data.vc.value : this.vc,
      status: data.status.present ? data.status.value : this.status,
      version: data.version.present ? data.version.value : this.version,
      file: data.file.present ? data.file.value : this.file,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      city: data.city.present ? data.city.value : this.city,
      tg: data.tg.present ? data.tg.value : this.tg,
      exp: data.exp.present ? data.exp.value : this.exp,
      totalExp: data.totalExp.present ? data.totalExp.value : this.totalExp,
      stack: data.stack.present ? data.stack.value : this.stack,
      edu: data.edu.present ? data.edu.value : this.edu,
      criteria: data.criteria.present ? data.criteria.value : this.criteria,
      summary: data.summary.present ? data.summary.value : this.summary,
      questions: data.questions.present ? data.questions.value : this.questions,
      note: data.note.present ? data.note.value : this.note,
      dateAdded: data.dateAdded.present ? data.dateAdded.value : this.dateAdded,
      searchIndex: data.searchIndex.present
          ? data.searchIndex.value
          : this.searchIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CandidatesTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('position: $position, ')
          ..write('posLabel: $posLabel, ')
          ..write('verdict: $verdict, ')
          ..write('vc: $vc, ')
          ..write('status: $status, ')
          ..write('version: $version, ')
          ..write('file: $file, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('city: $city, ')
          ..write('tg: $tg, ')
          ..write('exp: $exp, ')
          ..write('totalExp: $totalExp, ')
          ..write('stack: $stack, ')
          ..write('edu: $edu, ')
          ..write('criteria: $criteria, ')
          ..write('summary: $summary, ')
          ..write('questions: $questions, ')
          ..write('note: $note, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('searchIndex: $searchIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    position,
    posLabel,
    verdict,
    vc,
    status,
    version,
    file,
    email,
    phone,
    city,
    tg,
    exp,
    totalExp,
    stack,
    edu,
    criteria,
    summary,
    questions,
    note,
    dateAdded,
    searchIndex,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CandidatesTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.position == this.position &&
          other.posLabel == this.posLabel &&
          other.verdict == this.verdict &&
          other.vc == this.vc &&
          other.status == this.status &&
          other.version == this.version &&
          other.file == this.file &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.city == this.city &&
          other.tg == this.tg &&
          other.exp == this.exp &&
          other.totalExp == this.totalExp &&
          other.stack == this.stack &&
          other.edu == this.edu &&
          other.criteria == this.criteria &&
          other.summary == this.summary &&
          other.questions == this.questions &&
          other.note == this.note &&
          other.dateAdded == this.dateAdded &&
          other.searchIndex == this.searchIndex);
}

class CandidatesTableCompanion extends UpdateCompanion<CandidatesTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> position;
  final Value<String> posLabel;
  final Value<String> verdict;
  final Value<String> vc;
  final Value<String> status;
  final Value<int> version;
  final Value<String?> file;
  final Value<String?> email;
  final Value<String?> phone;
  final Value<String?> city;
  final Value<String?> tg;
  final Value<String?> exp;
  final Value<String?> totalExp;
  final Value<String?> stack;
  final Value<String?> edu;
  final Value<String?> criteria;
  final Value<String?> summary;
  final Value<String?> questions;
  final Value<String?> note;
  final Value<DateTime?> dateAdded;
  final Value<String> searchIndex;
  final Value<int> rowid;
  const CandidatesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.position = const Value.absent(),
    this.posLabel = const Value.absent(),
    this.verdict = const Value.absent(),
    this.vc = const Value.absent(),
    this.status = const Value.absent(),
    this.version = const Value.absent(),
    this.file = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.city = const Value.absent(),
    this.tg = const Value.absent(),
    this.exp = const Value.absent(),
    this.totalExp = const Value.absent(),
    this.stack = const Value.absent(),
    this.edu = const Value.absent(),
    this.criteria = const Value.absent(),
    this.summary = const Value.absent(),
    this.questions = const Value.absent(),
    this.note = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.searchIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CandidatesTableCompanion.insert({
    required String id,
    required String name,
    required String position,
    required String posLabel,
    required String verdict,
    required String vc,
    required String status,
    required int version,
    this.file = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.city = const Value.absent(),
    this.tg = const Value.absent(),
    this.exp = const Value.absent(),
    this.totalExp = const Value.absent(),
    this.stack = const Value.absent(),
    this.edu = const Value.absent(),
    this.criteria = const Value.absent(),
    this.summary = const Value.absent(),
    this.questions = const Value.absent(),
    this.note = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.searchIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       position = Value(position),
       posLabel = Value(posLabel),
       verdict = Value(verdict),
       vc = Value(vc),
       status = Value(status),
       version = Value(version);
  static Insertable<CandidatesTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? position,
    Expression<String>? posLabel,
    Expression<String>? verdict,
    Expression<String>? vc,
    Expression<String>? status,
    Expression<int>? version,
    Expression<String>? file,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? city,
    Expression<String>? tg,
    Expression<String>? exp,
    Expression<String>? totalExp,
    Expression<String>? stack,
    Expression<String>? edu,
    Expression<String>? criteria,
    Expression<String>? summary,
    Expression<String>? questions,
    Expression<String>? note,
    Expression<DateTime>? dateAdded,
    Expression<String>? searchIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (position != null) 'position': position,
      if (posLabel != null) 'pos_label': posLabel,
      if (verdict != null) 'verdict': verdict,
      if (vc != null) 'vc': vc,
      if (status != null) 'status': status,
      if (version != null) 'version': version,
      if (file != null) 'file': file,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (city != null) 'city': city,
      if (tg != null) 'tg': tg,
      if (exp != null) 'exp': exp,
      if (totalExp != null) 'total_exp': totalExp,
      if (stack != null) 'stack': stack,
      if (edu != null) 'edu': edu,
      if (criteria != null) 'criteria': criteria,
      if (summary != null) 'summary': summary,
      if (questions != null) 'questions': questions,
      if (note != null) 'note': note,
      if (dateAdded != null) 'date_added': dateAdded,
      if (searchIndex != null) 'search_index': searchIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CandidatesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? position,
    Value<String>? posLabel,
    Value<String>? verdict,
    Value<String>? vc,
    Value<String>? status,
    Value<int>? version,
    Value<String?>? file,
    Value<String?>? email,
    Value<String?>? phone,
    Value<String?>? city,
    Value<String?>? tg,
    Value<String?>? exp,
    Value<String?>? totalExp,
    Value<String?>? stack,
    Value<String?>? edu,
    Value<String?>? criteria,
    Value<String?>? summary,
    Value<String?>? questions,
    Value<String?>? note,
    Value<DateTime?>? dateAdded,
    Value<String>? searchIndex,
    Value<int>? rowid,
  }) {
    return CandidatesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      position: position ?? this.position,
      posLabel: posLabel ?? this.posLabel,
      verdict: verdict ?? this.verdict,
      vc: vc ?? this.vc,
      status: status ?? this.status,
      version: version ?? this.version,
      file: file ?? this.file,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      tg: tg ?? this.tg,
      exp: exp ?? this.exp,
      totalExp: totalExp ?? this.totalExp,
      stack: stack ?? this.stack,
      edu: edu ?? this.edu,
      criteria: criteria ?? this.criteria,
      summary: summary ?? this.summary,
      questions: questions ?? this.questions,
      note: note ?? this.note,
      dateAdded: dateAdded ?? this.dateAdded,
      searchIndex: searchIndex ?? this.searchIndex,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (position.present) {
      map['position'] = Variable<String>(position.value);
    }
    if (posLabel.present) {
      map['pos_label'] = Variable<String>(posLabel.value);
    }
    if (verdict.present) {
      map['verdict'] = Variable<String>(verdict.value);
    }
    if (vc.present) {
      map['vc'] = Variable<String>(vc.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (file.present) {
      map['file'] = Variable<String>(file.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (tg.present) {
      map['tg'] = Variable<String>(tg.value);
    }
    if (exp.present) {
      map['exp'] = Variable<String>(exp.value);
    }
    if (totalExp.present) {
      map['total_exp'] = Variable<String>(totalExp.value);
    }
    if (stack.present) {
      map['stack'] = Variable<String>(stack.value);
    }
    if (edu.present) {
      map['edu'] = Variable<String>(edu.value);
    }
    if (criteria.present) {
      map['criteria'] = Variable<String>(criteria.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (questions.present) {
      map['questions'] = Variable<String>(questions.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (dateAdded.present) {
      map['date_added'] = Variable<DateTime>(dateAdded.value);
    }
    if (searchIndex.present) {
      map['search_index'] = Variable<String>(searchIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CandidatesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('position: $position, ')
          ..write('posLabel: $posLabel, ')
          ..write('verdict: $verdict, ')
          ..write('vc: $vc, ')
          ..write('status: $status, ')
          ..write('version: $version, ')
          ..write('file: $file, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('city: $city, ')
          ..write('tg: $tg, ')
          ..write('exp: $exp, ')
          ..write('totalExp: $totalExp, ')
          ..write('stack: $stack, ')
          ..write('edu: $edu, ')
          ..write('criteria: $criteria, ')
          ..write('summary: $summary, ')
          ..write('questions: $questions, ')
          ..write('note: $note, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('searchIndex: $searchIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OutboxTableTable extends OutboxTable
    with TableInfo<$OutboxTableTable, OutboxTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OutboxTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _candidateIdMeta = const VerificationMeta(
    'candidateId',
  );
  @override
  late final GeneratedColumn<String> candidateId = GeneratedColumn<String>(
    'candidate_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _baseVersionMeta = const VerificationMeta(
    'baseVersion',
  );
  @override
  late final GeneratedColumn<int> baseVersion = GeneratedColumn<int>(
    'base_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _clientUpdatedAtMeta = const VerificationMeta(
    'clientUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> clientUpdatedAt =
      GeneratedColumn<DateTime>(
        'client_updated_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  @override
  late final GeneratedColumnWithTypeConverter<OutboxSyncStatus, String>
  syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: Constant(OutboxSyncStatus.pending.name),
  ).withConverter<OutboxSyncStatus>($OutboxTableTable.$convertersyncStatus);
  static const VerificationMeta _retryCountMeta = const VerificationMeta(
    'retryCount',
  );
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
    'retry_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _failedReasonMeta = const VerificationMeta(
    'failedReason',
  );
  @override
  late final GeneratedColumn<String> failedReason = GeneratedColumn<String>(
    'failed_reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    candidateId,
    baseVersion,
    status,
    note,
    clientUpdatedAt,
    syncStatus,
    retryCount,
    failedReason,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'outbox';
  @override
  VerificationContext validateIntegrity(
    Insertable<OutboxTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('candidate_id')) {
      context.handle(
        _candidateIdMeta,
        candidateId.isAcceptableOrUnknown(
          data['candidate_id']!,
          _candidateIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_candidateIdMeta);
    }
    if (data.containsKey('base_version')) {
      context.handle(
        _baseVersionMeta,
        baseVersion.isAcceptableOrUnknown(
          data['base_version']!,
          _baseVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_baseVersionMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('client_updated_at')) {
      context.handle(
        _clientUpdatedAtMeta,
        clientUpdatedAt.isAcceptableOrUnknown(
          data['client_updated_at']!,
          _clientUpdatedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_clientUpdatedAtMeta);
    }
    if (data.containsKey('retry_count')) {
      context.handle(
        _retryCountMeta,
        retryCount.isAcceptableOrUnknown(data['retry_count']!, _retryCountMeta),
      );
    }
    if (data.containsKey('failed_reason')) {
      context.handle(
        _failedReasonMeta,
        failedReason.isAcceptableOrUnknown(
          data['failed_reason']!,
          _failedReasonMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OutboxTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OutboxTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      candidateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}candidate_id'],
      )!,
      baseVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}base_version'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      clientUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}client_updated_at'],
      )!,
      syncStatus: $OutboxTableTable.$convertersyncStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sync_status'],
        )!,
      ),
      retryCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}retry_count'],
      )!,
      failedReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}failed_reason'],
      ),
    );
  }

  @override
  $OutboxTableTable createAlias(String alias) {
    return $OutboxTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<OutboxSyncStatus, String, String>
  $convertersyncStatus = const EnumNameConverter<OutboxSyncStatus>(
    OutboxSyncStatus.values,
  );
}

class OutboxTableData extends DataClass implements Insertable<OutboxTableData> {
  final int id;
  final String candidateId;
  final int baseVersion;
  final String? status;
  final String? note;
  final DateTime clientUpdatedAt;
  final OutboxSyncStatus syncStatus;
  final int retryCount;
  final String? failedReason;
  const OutboxTableData({
    required this.id,
    required this.candidateId,
    required this.baseVersion,
    this.status,
    this.note,
    required this.clientUpdatedAt,
    required this.syncStatus,
    required this.retryCount,
    this.failedReason,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['candidate_id'] = Variable<String>(candidateId);
    map['base_version'] = Variable<int>(baseVersion);
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['client_updated_at'] = Variable<DateTime>(clientUpdatedAt);
    {
      map['sync_status'] = Variable<String>(
        $OutboxTableTable.$convertersyncStatus.toSql(syncStatus),
      );
    }
    map['retry_count'] = Variable<int>(retryCount);
    if (!nullToAbsent || failedReason != null) {
      map['failed_reason'] = Variable<String>(failedReason);
    }
    return map;
  }

  OutboxTableCompanion toCompanion(bool nullToAbsent) {
    return OutboxTableCompanion(
      id: Value(id),
      candidateId: Value(candidateId),
      baseVersion: Value(baseVersion),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      clientUpdatedAt: Value(clientUpdatedAt),
      syncStatus: Value(syncStatus),
      retryCount: Value(retryCount),
      failedReason: failedReason == null && nullToAbsent
          ? const Value.absent()
          : Value(failedReason),
    );
  }

  factory OutboxTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OutboxTableData(
      id: serializer.fromJson<int>(json['id']),
      candidateId: serializer.fromJson<String>(json['candidateId']),
      baseVersion: serializer.fromJson<int>(json['baseVersion']),
      status: serializer.fromJson<String?>(json['status']),
      note: serializer.fromJson<String?>(json['note']),
      clientUpdatedAt: serializer.fromJson<DateTime>(json['clientUpdatedAt']),
      syncStatus: $OutboxTableTable.$convertersyncStatus.fromJson(
        serializer.fromJson<String>(json['syncStatus']),
      ),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      failedReason: serializer.fromJson<String?>(json['failedReason']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'candidateId': serializer.toJson<String>(candidateId),
      'baseVersion': serializer.toJson<int>(baseVersion),
      'status': serializer.toJson<String?>(status),
      'note': serializer.toJson<String?>(note),
      'clientUpdatedAt': serializer.toJson<DateTime>(clientUpdatedAt),
      'syncStatus': serializer.toJson<String>(
        $OutboxTableTable.$convertersyncStatus.toJson(syncStatus),
      ),
      'retryCount': serializer.toJson<int>(retryCount),
      'failedReason': serializer.toJson<String?>(failedReason),
    };
  }

  OutboxTableData copyWith({
    int? id,
    String? candidateId,
    int? baseVersion,
    Value<String?> status = const Value.absent(),
    Value<String?> note = const Value.absent(),
    DateTime? clientUpdatedAt,
    OutboxSyncStatus? syncStatus,
    int? retryCount,
    Value<String?> failedReason = const Value.absent(),
  }) => OutboxTableData(
    id: id ?? this.id,
    candidateId: candidateId ?? this.candidateId,
    baseVersion: baseVersion ?? this.baseVersion,
    status: status.present ? status.value : this.status,
    note: note.present ? note.value : this.note,
    clientUpdatedAt: clientUpdatedAt ?? this.clientUpdatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    retryCount: retryCount ?? this.retryCount,
    failedReason: failedReason.present ? failedReason.value : this.failedReason,
  );
  OutboxTableData copyWithCompanion(OutboxTableCompanion data) {
    return OutboxTableData(
      id: data.id.present ? data.id.value : this.id,
      candidateId: data.candidateId.present
          ? data.candidateId.value
          : this.candidateId,
      baseVersion: data.baseVersion.present
          ? data.baseVersion.value
          : this.baseVersion,
      status: data.status.present ? data.status.value : this.status,
      note: data.note.present ? data.note.value : this.note,
      clientUpdatedAt: data.clientUpdatedAt.present
          ? data.clientUpdatedAt.value
          : this.clientUpdatedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      retryCount: data.retryCount.present
          ? data.retryCount.value
          : this.retryCount,
      failedReason: data.failedReason.present
          ? data.failedReason.value
          : this.failedReason,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OutboxTableData(')
          ..write('id: $id, ')
          ..write('candidateId: $candidateId, ')
          ..write('baseVersion: $baseVersion, ')
          ..write('status: $status, ')
          ..write('note: $note, ')
          ..write('clientUpdatedAt: $clientUpdatedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('retryCount: $retryCount, ')
          ..write('failedReason: $failedReason')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    candidateId,
    baseVersion,
    status,
    note,
    clientUpdatedAt,
    syncStatus,
    retryCount,
    failedReason,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OutboxTableData &&
          other.id == this.id &&
          other.candidateId == this.candidateId &&
          other.baseVersion == this.baseVersion &&
          other.status == this.status &&
          other.note == this.note &&
          other.clientUpdatedAt == this.clientUpdatedAt &&
          other.syncStatus == this.syncStatus &&
          other.retryCount == this.retryCount &&
          other.failedReason == this.failedReason);
}

class OutboxTableCompanion extends UpdateCompanion<OutboxTableData> {
  final Value<int> id;
  final Value<String> candidateId;
  final Value<int> baseVersion;
  final Value<String?> status;
  final Value<String?> note;
  final Value<DateTime> clientUpdatedAt;
  final Value<OutboxSyncStatus> syncStatus;
  final Value<int> retryCount;
  final Value<String?> failedReason;
  const OutboxTableCompanion({
    this.id = const Value.absent(),
    this.candidateId = const Value.absent(),
    this.baseVersion = const Value.absent(),
    this.status = const Value.absent(),
    this.note = const Value.absent(),
    this.clientUpdatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.failedReason = const Value.absent(),
  });
  OutboxTableCompanion.insert({
    this.id = const Value.absent(),
    required String candidateId,
    required int baseVersion,
    this.status = const Value.absent(),
    this.note = const Value.absent(),
    required DateTime clientUpdatedAt,
    this.syncStatus = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.failedReason = const Value.absent(),
  }) : candidateId = Value(candidateId),
       baseVersion = Value(baseVersion),
       clientUpdatedAt = Value(clientUpdatedAt);
  static Insertable<OutboxTableData> custom({
    Expression<int>? id,
    Expression<String>? candidateId,
    Expression<int>? baseVersion,
    Expression<String>? status,
    Expression<String>? note,
    Expression<DateTime>? clientUpdatedAt,
    Expression<String>? syncStatus,
    Expression<int>? retryCount,
    Expression<String>? failedReason,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (candidateId != null) 'candidate_id': candidateId,
      if (baseVersion != null) 'base_version': baseVersion,
      if (status != null) 'status': status,
      if (note != null) 'note': note,
      if (clientUpdatedAt != null) 'client_updated_at': clientUpdatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (retryCount != null) 'retry_count': retryCount,
      if (failedReason != null) 'failed_reason': failedReason,
    });
  }

  OutboxTableCompanion copyWith({
    Value<int>? id,
    Value<String>? candidateId,
    Value<int>? baseVersion,
    Value<String?>? status,
    Value<String?>? note,
    Value<DateTime>? clientUpdatedAt,
    Value<OutboxSyncStatus>? syncStatus,
    Value<int>? retryCount,
    Value<String?>? failedReason,
  }) {
    return OutboxTableCompanion(
      id: id ?? this.id,
      candidateId: candidateId ?? this.candidateId,
      baseVersion: baseVersion ?? this.baseVersion,
      status: status ?? this.status,
      note: note ?? this.note,
      clientUpdatedAt: clientUpdatedAt ?? this.clientUpdatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      retryCount: retryCount ?? this.retryCount,
      failedReason: failedReason ?? this.failedReason,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (candidateId.present) {
      map['candidate_id'] = Variable<String>(candidateId.value);
    }
    if (baseVersion.present) {
      map['base_version'] = Variable<int>(baseVersion.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (clientUpdatedAt.present) {
      map['client_updated_at'] = Variable<DateTime>(clientUpdatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(
        $OutboxTableTable.$convertersyncStatus.toSql(syncStatus.value),
      );
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (failedReason.present) {
      map['failed_reason'] = Variable<String>(failedReason.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OutboxTableCompanion(')
          ..write('id: $id, ')
          ..write('candidateId: $candidateId, ')
          ..write('baseVersion: $baseVersion, ')
          ..write('status: $status, ')
          ..write('note: $note, ')
          ..write('clientUpdatedAt: $clientUpdatedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('retryCount: $retryCount, ')
          ..write('failedReason: $failedReason')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CandidatesTableTable candidatesTable = $CandidatesTableTable(
    this,
  );
  late final $OutboxTableTable outboxTable = $OutboxTableTable(this);
  late final CandidatesDao candidatesDao = CandidatesDao(this as AppDatabase);
  late final OutboxDao outboxDao = OutboxDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    candidatesTable,
    outboxTable,
  ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$CandidatesTableTableCreateCompanionBuilder =
    CandidatesTableCompanion Function({
      required String id,
      required String name,
      required String position,
      required String posLabel,
      required String verdict,
      required String vc,
      required String status,
      required int version,
      Value<String?> file,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> city,
      Value<String?> tg,
      Value<String?> exp,
      Value<String?> totalExp,
      Value<String?> stack,
      Value<String?> edu,
      Value<String?> criteria,
      Value<String?> summary,
      Value<String?> questions,
      Value<String?> note,
      Value<DateTime?> dateAdded,
      Value<String> searchIndex,
      Value<int> rowid,
    });
typedef $$CandidatesTableTableUpdateCompanionBuilder =
    CandidatesTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> position,
      Value<String> posLabel,
      Value<String> verdict,
      Value<String> vc,
      Value<String> status,
      Value<int> version,
      Value<String?> file,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> city,
      Value<String?> tg,
      Value<String?> exp,
      Value<String?> totalExp,
      Value<String?> stack,
      Value<String?> edu,
      Value<String?> criteria,
      Value<String?> summary,
      Value<String?> questions,
      Value<String?> note,
      Value<DateTime?> dateAdded,
      Value<String> searchIndex,
      Value<int> rowid,
    });

class $$CandidatesTableTableFilterComposer
    extends Composer<_$AppDatabase, $CandidatesTableTable> {
  $$CandidatesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get posLabel => $composableBuilder(
    column: $table.posLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get verdict => $composableBuilder(
    column: $table.verdict,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vc => $composableBuilder(
    column: $table.vc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get file => $composableBuilder(
    column: $table.file,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tg => $composableBuilder(
    column: $table.tg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exp => $composableBuilder(
    column: $table.exp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get totalExp => $composableBuilder(
    column: $table.totalExp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stack => $composableBuilder(
    column: $table.stack,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get edu => $composableBuilder(
    column: $table.edu,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get criteria => $composableBuilder(
    column: $table.criteria,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get questions => $composableBuilder(
    column: $table.questions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateAdded => $composableBuilder(
    column: $table.dateAdded,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get searchIndex => $composableBuilder(
    column: $table.searchIndex,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CandidatesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CandidatesTableTable> {
  $$CandidatesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get posLabel => $composableBuilder(
    column: $table.posLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get verdict => $composableBuilder(
    column: $table.verdict,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vc => $composableBuilder(
    column: $table.vc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get file => $composableBuilder(
    column: $table.file,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tg => $composableBuilder(
    column: $table.tg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exp => $composableBuilder(
    column: $table.exp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get totalExp => $composableBuilder(
    column: $table.totalExp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stack => $composableBuilder(
    column: $table.stack,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get edu => $composableBuilder(
    column: $table.edu,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get criteria => $composableBuilder(
    column: $table.criteria,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get questions => $composableBuilder(
    column: $table.questions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateAdded => $composableBuilder(
    column: $table.dateAdded,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get searchIndex => $composableBuilder(
    column: $table.searchIndex,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CandidatesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CandidatesTableTable> {
  $$CandidatesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<String> get posLabel =>
      $composableBuilder(column: $table.posLabel, builder: (column) => column);

  GeneratedColumn<String> get verdict =>
      $composableBuilder(column: $table.verdict, builder: (column) => column);

  GeneratedColumn<String> get vc =>
      $composableBuilder(column: $table.vc, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get file =>
      $composableBuilder(column: $table.file, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get tg =>
      $composableBuilder(column: $table.tg, builder: (column) => column);

  GeneratedColumn<String> get exp =>
      $composableBuilder(column: $table.exp, builder: (column) => column);

  GeneratedColumn<String> get totalExp =>
      $composableBuilder(column: $table.totalExp, builder: (column) => column);

  GeneratedColumn<String> get stack =>
      $composableBuilder(column: $table.stack, builder: (column) => column);

  GeneratedColumn<String> get edu =>
      $composableBuilder(column: $table.edu, builder: (column) => column);

  GeneratedColumn<String> get criteria =>
      $composableBuilder(column: $table.criteria, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<String> get questions =>
      $composableBuilder(column: $table.questions, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get dateAdded =>
      $composableBuilder(column: $table.dateAdded, builder: (column) => column);

  GeneratedColumn<String> get searchIndex => $composableBuilder(
    column: $table.searchIndex,
    builder: (column) => column,
  );
}

class $$CandidatesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CandidatesTableTable,
          CandidatesTableData,
          $$CandidatesTableTableFilterComposer,
          $$CandidatesTableTableOrderingComposer,
          $$CandidatesTableTableAnnotationComposer,
          $$CandidatesTableTableCreateCompanionBuilder,
          $$CandidatesTableTableUpdateCompanionBuilder,
          (
            CandidatesTableData,
            BaseReferences<
              _$AppDatabase,
              $CandidatesTableTable,
              CandidatesTableData
            >,
          ),
          CandidatesTableData,
          PrefetchHooks Function()
        > {
  $$CandidatesTableTableTableManager(
    _$AppDatabase db,
    $CandidatesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CandidatesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CandidatesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CandidatesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> position = const Value.absent(),
                Value<String> posLabel = const Value.absent(),
                Value<String> verdict = const Value.absent(),
                Value<String> vc = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<String?> file = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> tg = const Value.absent(),
                Value<String?> exp = const Value.absent(),
                Value<String?> totalExp = const Value.absent(),
                Value<String?> stack = const Value.absent(),
                Value<String?> edu = const Value.absent(),
                Value<String?> criteria = const Value.absent(),
                Value<String?> summary = const Value.absent(),
                Value<String?> questions = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime?> dateAdded = const Value.absent(),
                Value<String> searchIndex = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CandidatesTableCompanion(
                id: id,
                name: name,
                position: position,
                posLabel: posLabel,
                verdict: verdict,
                vc: vc,
                status: status,
                version: version,
                file: file,
                email: email,
                phone: phone,
                city: city,
                tg: tg,
                exp: exp,
                totalExp: totalExp,
                stack: stack,
                edu: edu,
                criteria: criteria,
                summary: summary,
                questions: questions,
                note: note,
                dateAdded: dateAdded,
                searchIndex: searchIndex,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String position,
                required String posLabel,
                required String verdict,
                required String vc,
                required String status,
                required int version,
                Value<String?> file = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> tg = const Value.absent(),
                Value<String?> exp = const Value.absent(),
                Value<String?> totalExp = const Value.absent(),
                Value<String?> stack = const Value.absent(),
                Value<String?> edu = const Value.absent(),
                Value<String?> criteria = const Value.absent(),
                Value<String?> summary = const Value.absent(),
                Value<String?> questions = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime?> dateAdded = const Value.absent(),
                Value<String> searchIndex = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CandidatesTableCompanion.insert(
                id: id,
                name: name,
                position: position,
                posLabel: posLabel,
                verdict: verdict,
                vc: vc,
                status: status,
                version: version,
                file: file,
                email: email,
                phone: phone,
                city: city,
                tg: tg,
                exp: exp,
                totalExp: totalExp,
                stack: stack,
                edu: edu,
                criteria: criteria,
                summary: summary,
                questions: questions,
                note: note,
                dateAdded: dateAdded,
                searchIndex: searchIndex,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CandidatesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CandidatesTableTable,
      CandidatesTableData,
      $$CandidatesTableTableFilterComposer,
      $$CandidatesTableTableOrderingComposer,
      $$CandidatesTableTableAnnotationComposer,
      $$CandidatesTableTableCreateCompanionBuilder,
      $$CandidatesTableTableUpdateCompanionBuilder,
      (
        CandidatesTableData,
        BaseReferences<
          _$AppDatabase,
          $CandidatesTableTable,
          CandidatesTableData
        >,
      ),
      CandidatesTableData,
      PrefetchHooks Function()
    >;
typedef $$OutboxTableTableCreateCompanionBuilder =
    OutboxTableCompanion Function({
      Value<int> id,
      required String candidateId,
      required int baseVersion,
      Value<String?> status,
      Value<String?> note,
      required DateTime clientUpdatedAt,
      Value<OutboxSyncStatus> syncStatus,
      Value<int> retryCount,
      Value<String?> failedReason,
    });
typedef $$OutboxTableTableUpdateCompanionBuilder =
    OutboxTableCompanion Function({
      Value<int> id,
      Value<String> candidateId,
      Value<int> baseVersion,
      Value<String?> status,
      Value<String?> note,
      Value<DateTime> clientUpdatedAt,
      Value<OutboxSyncStatus> syncStatus,
      Value<int> retryCount,
      Value<String?> failedReason,
    });

class $$OutboxTableTableFilterComposer
    extends Composer<_$AppDatabase, $OutboxTableTable> {
  $$OutboxTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get candidateId => $composableBuilder(
    column: $table.candidateId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get baseVersion => $composableBuilder(
    column: $table.baseVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get clientUpdatedAt => $composableBuilder(
    column: $table.clientUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<OutboxSyncStatus, OutboxSyncStatus, String>
  get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get failedReason => $composableBuilder(
    column: $table.failedReason,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OutboxTableTableOrderingComposer
    extends Composer<_$AppDatabase, $OutboxTableTable> {
  $$OutboxTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get candidateId => $composableBuilder(
    column: $table.candidateId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baseVersion => $composableBuilder(
    column: $table.baseVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get clientUpdatedAt => $composableBuilder(
    column: $table.clientUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get failedReason => $composableBuilder(
    column: $table.failedReason,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OutboxTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $OutboxTableTable> {
  $$OutboxTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get candidateId => $composableBuilder(
    column: $table.candidateId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get baseVersion => $composableBuilder(
    column: $table.baseVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get clientUpdatedAt => $composableBuilder(
    column: $table.clientUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<OutboxSyncStatus, String> get syncStatus =>
      $composableBuilder(
        column: $table.syncStatus,
        builder: (column) => column,
      );

  GeneratedColumn<int> get retryCount => $composableBuilder(
    column: $table.retryCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get failedReason => $composableBuilder(
    column: $table.failedReason,
    builder: (column) => column,
  );
}

class $$OutboxTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OutboxTableTable,
          OutboxTableData,
          $$OutboxTableTableFilterComposer,
          $$OutboxTableTableOrderingComposer,
          $$OutboxTableTableAnnotationComposer,
          $$OutboxTableTableCreateCompanionBuilder,
          $$OutboxTableTableUpdateCompanionBuilder,
          (
            OutboxTableData,
            BaseReferences<_$AppDatabase, $OutboxTableTable, OutboxTableData>,
          ),
          OutboxTableData,
          PrefetchHooks Function()
        > {
  $$OutboxTableTableTableManager(_$AppDatabase db, $OutboxTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OutboxTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OutboxTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OutboxTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> candidateId = const Value.absent(),
                Value<int> baseVersion = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime> clientUpdatedAt = const Value.absent(),
                Value<OutboxSyncStatus> syncStatus = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<String?> failedReason = const Value.absent(),
              }) => OutboxTableCompanion(
                id: id,
                candidateId: candidateId,
                baseVersion: baseVersion,
                status: status,
                note: note,
                clientUpdatedAt: clientUpdatedAt,
                syncStatus: syncStatus,
                retryCount: retryCount,
                failedReason: failedReason,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String candidateId,
                required int baseVersion,
                Value<String?> status = const Value.absent(),
                Value<String?> note = const Value.absent(),
                required DateTime clientUpdatedAt,
                Value<OutboxSyncStatus> syncStatus = const Value.absent(),
                Value<int> retryCount = const Value.absent(),
                Value<String?> failedReason = const Value.absent(),
              }) => OutboxTableCompanion.insert(
                id: id,
                candidateId: candidateId,
                baseVersion: baseVersion,
                status: status,
                note: note,
                clientUpdatedAt: clientUpdatedAt,
                syncStatus: syncStatus,
                retryCount: retryCount,
                failedReason: failedReason,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OutboxTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OutboxTableTable,
      OutboxTableData,
      $$OutboxTableTableFilterComposer,
      $$OutboxTableTableOrderingComposer,
      $$OutboxTableTableAnnotationComposer,
      $$OutboxTableTableCreateCompanionBuilder,
      $$OutboxTableTableUpdateCompanionBuilder,
      (
        OutboxTableData,
        BaseReferences<_$AppDatabase, $OutboxTableTable, OutboxTableData>,
      ),
      OutboxTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CandidatesTableTableTableManager get candidatesTable =>
      $$CandidatesTableTableTableManager(_db, _db.candidatesTable);
  $$OutboxTableTableTableManager get outboxTable =>
      $$OutboxTableTableTableManager(_db, _db.outboxTable);
}
