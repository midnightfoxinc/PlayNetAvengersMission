.class public Lcom/disneymobile/mocha/NSUserDefaults;
.super Ljava/lang/Object;
.source "NSUserDefaults.java"


# static fields
.field private static backlogSettings:Lcom/disneymobile/mocha/NSUserDefaults;

.field private static profileCacheUserDefaults:Lcom/disneymobile/mocha/NSUserDefaults;

.field private static standardUserDefaults:Lcom/disneymobile/mocha/NSUserDefaults;


# instance fields
.field private prefs:Landroid/content/SharedPreferences;

.field private final prefsFile:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 15
    new-instance v0, Lcom/disneymobile/mocha/NSUserDefaults;

    const-string v1, "standardUserDefaults"

    invoke-direct {v0, v1}, Lcom/disneymobile/mocha/NSUserDefaults;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/disneymobile/mocha/NSUserDefaults;->standardUserDefaults:Lcom/disneymobile/mocha/NSUserDefaults;

    .line 16
    new-instance v0, Lcom/disneymobile/mocha/NSUserDefaults;

    const-string v1, "CSProfileCache"

    invoke-direct {v0, v1}, Lcom/disneymobile/mocha/NSUserDefaults;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/disneymobile/mocha/NSUserDefaults;->profileCacheUserDefaults:Lcom/disneymobile/mocha/NSUserDefaults;

    .line 17
    new-instance v0, Lcom/disneymobile/mocha/NSUserDefaults;

    const-string v1, "backlogSettings"

    invoke-direct {v0, v1}, Lcom/disneymobile/mocha/NSUserDefaults;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/disneymobile/mocha/NSUserDefaults;->backlogSettings:Lcom/disneymobile/mocha/NSUserDefaults;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "prefsFile"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefsFile:Ljava/lang/String;

    .line 36
    invoke-static {}, Lcom/disneymobile/mocha/support/Support;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    .line 37
    return-void
.end method

.method public static backlogSettings()Lcom/disneymobile/mocha/NSUserDefaults;
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/disneymobile/mocha/NSUserDefaults;->backlogSettings:Lcom/disneymobile/mocha/NSUserDefaults;

    return-object v0
.end method

.method public static profileCacheUserDefaults()Lcom/disneymobile/mocha/NSUserDefaults;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lcom/disneymobile/mocha/NSUserDefaults;->profileCacheUserDefaults:Lcom/disneymobile/mocha/NSUserDefaults;

    return-object v0
.end method

.method public static standardUserDefaults()Lcom/disneymobile/mocha/NSUserDefaults;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/disneymobile/mocha/NSUserDefaults;->standardUserDefaults:Lcom/disneymobile/mocha/NSUserDefaults;

    return-object v0
.end method


# virtual methods
.method public boolForKey(Ljava/lang/String;)Z
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 126
    invoke-virtual {p0, p1}, Lcom/disneymobile/mocha/NSUserDefaults;->booleanForKey(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    .line 127
    .local v0, "result":Ljava/lang/Boolean;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public booleanForKey(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 131
    iget-object v0, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 132
    iget-object v0, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 134
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 171
    iget-object v0, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public dictionaryForKey(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 157
    invoke-virtual {p0, p1}, Lcom/disneymobile/mocha/NSUserDefaults;->stringForKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 158
    .local v0, "plist":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 159
    sget-object v2, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;->Default:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;

    sget-object v3, Lcom/disneymobile/mocha/NSPropertyListSerialization;->NSPropertyListXMLFormat_v1_0:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

    invoke-static {v0, v2, v3, v1}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->propertyListWithStringOptionsFormatAndError(Ljava/lang/String;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListReadOptions;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;Lcom/disneymobile/mocha/support/Out;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 161
    :cond_0
    return-object v1
.end method

.method public dictionaryRepresentation()Ljava/util/HashMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 175
    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public floatForKey(Ljava/lang/String;)Ljava/lang/Float;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 149
    iget-object v0, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 150
    iget-object v0, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 152
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSharedPreferencesName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefsFile:Ljava/lang/String;

    return-object v0
.end method

.method public integerForKey(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 138
    iget-object v0, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 139
    iget-object v0, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 141
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public longForKey(Ljava/lang/String;)J
    .locals 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 145
    iget-object v0, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    const-wide/16 v2, 0x0

    invoke-interface {v0, p1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public objectForKey(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 119
    iget-object v0, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 120
    iget-object v0, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 122
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public removeKey(Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 113
    iget-object v1, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 114
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 115
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 116
    return-void
.end method

.method public removeObjectForKey(Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 165
    iget-object v1, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 166
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 167
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 168
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 179
    iget-object v0, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 180
    return-void
.end method

.method public setBooleanForKey(Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 3
    .param p1, "value"    # Ljava/lang/Boolean;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 52
    if-nez p1, :cond_0

    .line 53
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "NSUserDefaults.setBooleanForKey value parameter must be non-null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 54
    :cond_0
    iget-object v1, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 55
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-interface {v0, p2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 56
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 57
    return-void
.end method

.method public setDictionaryForKey(Ljava/util/HashMap;Ljava/lang/String;)V
    .locals 5
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 84
    .local p1, "value":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    if-nez p1, :cond_0

    .line 85
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "NSUserDefaults.setDictionaryForKey value parameter must be non-null."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 86
    :cond_0
    iget-object v2, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 87
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    sget-object v2, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;->XMLFormat_v1_0:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;

    sget-object v3, Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListWriteOptions;->Default:Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListWriteOptions;

    const/4 v4, 0x0

    invoke-static {p1, v2, v3, v4}, Lcom/disneymobile/mocha/NSPropertyListSerialization;->stringWithPropertyListFormatOptionsAndError(Ljava/lang/Object;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListFormat;Lcom/disneymobile/mocha/NSPropertyListSerialization$NSPropertyListWriteOptions;Lcom/disneymobile/mocha/support/Out;)Ljava/lang/String;

    move-result-object v1

    .line 88
    .local v1, "plist":Ljava/lang/String;
    invoke-interface {v0, p2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 89
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 90
    return-void
.end method

.method public setFloatForKey(Ljava/lang/Float;Ljava/lang/String;)V
    .locals 3
    .param p1, "value"    # Ljava/lang/Float;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 76
    if-nez p1, :cond_0

    .line 77
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "NSUserDefaults.setFloatForKey value parameter must be non-null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 78
    :cond_0
    iget-object v1, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 79
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-interface {v0, p2, v1}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    .line 80
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 81
    return-void
.end method

.method public setIntegerForKey(Ljava/lang/Integer;Ljava/lang/String;)V
    .locals 3
    .param p1, "value"    # Ljava/lang/Integer;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 60
    if-nez p1, :cond_0

    .line 61
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "NSUserDefaults.setIntegerForKey value parameter must be non-null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 62
    :cond_0
    iget-object v1, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 63
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v0, p2, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 64
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 65
    return-void
.end method

.method public setLongForKey(Ljava/lang/Long;Ljava/lang/String;)V
    .locals 4
    .param p1, "value"    # Ljava/lang/Long;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 68
    if-nez p1, :cond_0

    .line 69
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "NSUserDefaults.setLongForKey value parameter must be non-null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 70
    :cond_0
    iget-object v1, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 71
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {v0, p2, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 72
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 73
    return-void
.end method

.method public setObjectForKey(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 44
    if-nez p1, :cond_0

    .line 45
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "NSUserDefaults.setObjectForKey value parameter must be non-null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 46
    :cond_0
    iget-object v1, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 47
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 48
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 49
    return-void
.end method

.method public setStringForKey(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 101
    if-nez p1, :cond_0

    .line 102
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "setStringForKey value parameter must be non-null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 103
    :cond_0
    iget-object v1, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 104
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 105
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 106
    return-void
.end method

.method public stringForKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 93
    iget-object v0, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public stringForKeySafe(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 97
    iget-object v0, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    const-string v1, ""

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public synchronize()V
    .locals 3

    .prologue
    .line 183
    invoke-static {}, Lcom/disneymobile/mocha/support/Support;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefsFile:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/disneymobile/mocha/NSUserDefaults;->prefs:Landroid/content/SharedPreferences;

    .line 184
    return-void
.end method
