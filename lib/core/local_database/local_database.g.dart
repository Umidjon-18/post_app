// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// ignore_for_file: type=lint
class $PublicNewsTable extends PublicNews
    with TableInfo<$PublicNewsTable, PublicNew> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PublicNewsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String> link = GeneratedColumn<String>(
      'link', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _jetpackFeaturedMediaUrlMeta =
      const VerificationMeta('jetpackFeaturedMediaUrl');
  @override
  late final GeneratedColumn<String> jetpackFeaturedMediaUrl =
      GeneratedColumn<String>('jetpack_featured_media_url', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, link, jetpackFeaturedMediaUrl, date];
  @override
  String get aliasedName => _alias ?? 'public_news';
  @override
  String get actualTableName => 'public_news';
  @override
  VerificationContext validateIntegrity(Insertable<PublicNew> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    }
    if (data.containsKey('jetpack_featured_media_url')) {
      context.handle(
          _jetpackFeaturedMediaUrlMeta,
          jetpackFeaturedMediaUrl.isAcceptableOrUnknown(
              data['jetpack_featured_media_url']!,
              _jetpackFeaturedMediaUrlMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PublicNew map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PublicNew(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      link: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link']),
      jetpackFeaturedMediaUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}jetpack_featured_media_url']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date']),
    );
  }

  @override
  $PublicNewsTable createAlias(String alias) {
    return $PublicNewsTable(attachedDatabase, alias);
  }
}

class PublicNew extends DataClass implements Insertable<PublicNew> {
  final int? id;
  final String? title;
  final String? link;
  final String? jetpackFeaturedMediaUrl;
  final String? date;
  const PublicNew(
      {this.id,
      this.title,
      this.link,
      this.jetpackFeaturedMediaUrl,
      this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || link != null) {
      map['link'] = Variable<String>(link);
    }
    if (!nullToAbsent || jetpackFeaturedMediaUrl != null) {
      map['jetpack_featured_media_url'] =
          Variable<String>(jetpackFeaturedMediaUrl);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<String>(date);
    }
    return map;
  }

  PublicNewsCompanion toCompanion(bool nullToAbsent) {
    return PublicNewsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      link: link == null && nullToAbsent ? const Value.absent() : Value(link),
      jetpackFeaturedMediaUrl: jetpackFeaturedMediaUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(jetpackFeaturedMediaUrl),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory PublicNew.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PublicNew(
      id: serializer.fromJson<int?>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      link: serializer.fromJson<String?>(json['link']),
      jetpackFeaturedMediaUrl:
          serializer.fromJson<String?>(json['jetpackFeaturedMediaUrl']),
      date: serializer.fromJson<String?>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'title': serializer.toJson<String?>(title),
      'link': serializer.toJson<String?>(link),
      'jetpackFeaturedMediaUrl':
          serializer.toJson<String?>(jetpackFeaturedMediaUrl),
      'date': serializer.toJson<String?>(date),
    };
  }

  PublicNew copyWith(
          {Value<int?> id = const Value.absent(),
          Value<String?> title = const Value.absent(),
          Value<String?> link = const Value.absent(),
          Value<String?> jetpackFeaturedMediaUrl = const Value.absent(),
          Value<String?> date = const Value.absent()}) =>
      PublicNew(
        id: id.present ? id.value : this.id,
        title: title.present ? title.value : this.title,
        link: link.present ? link.value : this.link,
        jetpackFeaturedMediaUrl: jetpackFeaturedMediaUrl.present
            ? jetpackFeaturedMediaUrl.value
            : this.jetpackFeaturedMediaUrl,
        date: date.present ? date.value : this.date,
      );
  @override
  String toString() {
    return (StringBuffer('PublicNew(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('link: $link, ')
          ..write('jetpackFeaturedMediaUrl: $jetpackFeaturedMediaUrl, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, link, jetpackFeaturedMediaUrl, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PublicNew &&
          other.id == this.id &&
          other.title == this.title &&
          other.link == this.link &&
          other.jetpackFeaturedMediaUrl == this.jetpackFeaturedMediaUrl &&
          other.date == this.date);
}

class PublicNewsCompanion extends UpdateCompanion<PublicNew> {
  final Value<int?> id;
  final Value<String?> title;
  final Value<String?> link;
  final Value<String?> jetpackFeaturedMediaUrl;
  final Value<String?> date;
  const PublicNewsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.link = const Value.absent(),
    this.jetpackFeaturedMediaUrl = const Value.absent(),
    this.date = const Value.absent(),
  });
  PublicNewsCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.link = const Value.absent(),
    this.jetpackFeaturedMediaUrl = const Value.absent(),
    this.date = const Value.absent(),
  });
  static Insertable<PublicNew> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? link,
    Expression<String>? jetpackFeaturedMediaUrl,
    Expression<String>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (link != null) 'link': link,
      if (jetpackFeaturedMediaUrl != null)
        'jetpack_featured_media_url': jetpackFeaturedMediaUrl,
      if (date != null) 'date': date,
    });
  }

  PublicNewsCompanion copyWith(
      {Value<int?>? id,
      Value<String?>? title,
      Value<String?>? link,
      Value<String?>? jetpackFeaturedMediaUrl,
      Value<String?>? date}) {
    return PublicNewsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      link: link ?? this.link,
      jetpackFeaturedMediaUrl:
          jetpackFeaturedMediaUrl ?? this.jetpackFeaturedMediaUrl,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (jetpackFeaturedMediaUrl.present) {
      map['jetpack_featured_media_url'] =
          Variable<String>(jetpackFeaturedMediaUrl.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PublicNewsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('link: $link, ')
          ..write('jetpackFeaturedMediaUrl: $jetpackFeaturedMediaUrl, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $PublicNewsTable publicNews = $PublicNewsTable(this);
  late final PublicNewsDao publicNewsDao = PublicNewsDao(this as LocalDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [publicNews];
}
