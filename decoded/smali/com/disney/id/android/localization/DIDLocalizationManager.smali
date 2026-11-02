.class public Lcom/disney/id/android/localization/DIDLocalizationManager;
.super Ljava/lang/Object;
.source "DIDLocalizationManager.java"


# static fields
.field private static final MESSAGE_KEY:Ljava/lang/String; = "message"

.field private static final MOBILE_KEY:Ljava/lang/String; = "mobile"

.field private static final SERIALIZED_FILENAME_FORMAT:Ljava/lang/String; = "did_%s"

.field private static final TAG:Ljava/lang/String;

.field private static instance:Lcom/disney/id/android/localization/DIDLocalizationManager;


# instance fields
.field private db:Lorg/json/JSONObject;

.field private loadedURL:Ljava/lang/String;

.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const-class v0, Lcom/disney/id/android/localization/DIDLocalizationManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/localization/DIDLocalizationManager;->TAG:Ljava/lang/String;

    .line 32
    const/4 v0, 0x0

    sput-object v0, Lcom/disney/id/android/localization/DIDLocalizationManager;->instance:Lcom/disney/id/android/localization/DIDLocalizationManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/id/android/localization/DIDLocalizationManager;->loadedURL:Ljava/lang/String;

    .line 39
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/disney/id/android/localization/DIDLocalizationManager;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$102(Lcom/disney/id/android/localization/DIDLocalizationManager;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/localization/DIDLocalizationManager;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/disney/id/android/localization/DIDLocalizationManager;->loadedURL:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$202(Lcom/disney/id/android/localization/DIDLocalizationManager;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/localization/DIDLocalizationManager;
    .param p1, "x1"    # Lorg/json/JSONObject;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/disney/id/android/localization/DIDLocalizationManager;->db:Lorg/json/JSONObject;

    return-object p1
.end method

.method static synthetic access$300(Lcom/disney/id/android/localization/DIDLocalizationManager;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/localization/DIDLocalizationManager;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lcom/disney/id/android/localization/DIDLocalizationManager;->loadFromRaw(Ljava/lang/String;)V

    return-void
.end method

.method private getDbIdentifier(Ljava/lang/String;)I
    .locals 4
    .param p1, "loadLangPref"    # Ljava/lang/String;

    .prologue
    .line 105
    iget-object v1, p0, Lcom/disney/id/android/localization/DIDLocalizationManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 106
    .local v0, "packageName":Ljava/lang/String;
    iget-object v1, p0, Lcom/disney/id/android/localization/DIDLocalizationManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {p1}, Lcom/disney/id/android/localization/DIDLocalizationManager;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "raw"

    invoke-virtual {v1, v2, v3, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method private static getFilename(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "langPref"    # Ljava/lang/String;

    .prologue
    .line 97
    const/4 v0, 0x0

    .line 98
    .local v0, "filename":Ljava/lang/String;
    if-eqz p0, :cond_0

    .line 99
    const-string v1, "did_%s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "-"

    const-string v5, "_"

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 101
    :cond_0
    return-object v0
.end method

.method public static getInstance()Lcom/disney/id/android/localization/DIDLocalizationManager;
    .locals 1

    .prologue
    .line 74
    sget-object v0, Lcom/disney/id/android/localization/DIDLocalizationManager;->instance:Lcom/disney/id/android/localization/DIDLocalizationManager;

    if-nez v0, :cond_0

    .line 75
    new-instance v0, Lcom/disney/id/android/localization/DIDLocalizationManager;

    invoke-direct {v0}, Lcom/disney/id/android/localization/DIDLocalizationManager;-><init>()V

    sput-object v0, Lcom/disney/id/android/localization/DIDLocalizationManager;->instance:Lcom/disney/id/android/localization/DIDLocalizationManager;

    .line 77
    :cond_0
    sget-object v0, Lcom/disney/id/android/localization/DIDLocalizationManager;->instance:Lcom/disney/id/android/localization/DIDLocalizationManager;

    return-object v0
.end method

.method private getMobileJSON()Lorg/json/JSONObject;
    .locals 2

    .prologue
    .line 65
    iget-object v0, p0, Lcom/disney/id/android/localization/DIDLocalizationManager;->db:Lorg/json/JSONObject;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/disney/id/android/localization/DIDLocalizationManager;->db:Lorg/json/JSONObject;

    const-string v1, "mobile"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 67
    :try_start_0
    iget-object v0, p0, Lcom/disney/id/android/localization/DIDLocalizationManager;->db:Lorg/json/JSONObject;

    const-string v1, "mobile"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 70
    :goto_0
    return-object v0

    .line 68
    :catch_0
    move-exception v0

    .line 70
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private loadFromL10N(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "loadLangPref"    # Ljava/lang/String;
    .param p2, "loadAgeBand"    # Ljava/lang/String;

    .prologue
    .line 113
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .local v0, "builder":Ljava/lang/StringBuilder;
    const-string v3, "https://"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getEnv()Ljava/lang/String;

    move-result-object v3

    const-string v4, "prod"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 116
    const-string v3, "stg."

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    :cond_0
    const-string v3, "cdn.registerdisney.go.com/v2/"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getClientId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    const/16 v3, 0x2d

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 120
    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getCoreServicesEnv()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    const/16 v3, 0x2f

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 122
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    const-string v3, "?include=l10n&collection=mobile&jsonFormat=compact"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getEnv()Ljava/lang/String;

    move-result-object v3

    const-string v4, "qa"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 125
    const-string v3, "&content=qa"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    :cond_1
    if-eqz p2, :cond_2

    .line 127
    const-string v3, "&ageBand="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 131
    .local v2, "url":Ljava/lang/String;
    iget-object v3, p0, Lcom/disney/id/android/localization/DIDLocalizationManager;->loadedURL:Ljava/lang/String;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/disney/id/android/localization/DIDLocalizationManager;->loadedURL:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 132
    :cond_3
    new-instance v1, Lcom/disney/id/android/localization/L10nRequest;

    const/4 v3, 0x0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/disney/id/android/localization/DIDLocalizationManager$1;

    invoke-direct {v5, p0, v2}, Lcom/disney/id/android/localization/DIDLocalizationManager$1;-><init>(Lcom/disney/id/android/localization/DIDLocalizationManager;Ljava/lang/String;)V

    new-instance v6, Lcom/disney/id/android/localization/DIDLocalizationManager$2;

    invoke-direct {v6, p0, p1}, Lcom/disney/id/android/localization/DIDLocalizationManager$2;-><init>(Lcom/disney/id/android/localization/DIDLocalizationManager;Ljava/lang/String;)V

    invoke-direct {v1, v3, v4, v5, v6}, Lcom/disney/id/android/localization/L10nRequest;-><init>(ILjava/lang/String;Lcom/disney/id/android/volley/Response$Listener;Lcom/disney/id/android/volley/Response$ErrorListener;)V

    .line 148
    .local v1, "req":Lcom/disney/id/android/localization/L10nRequest;
    iget-object v3, p0, Lcom/disney/id/android/localization/DIDLocalizationManager;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/disney/id/android/volley/VolleyManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/volley/VolleyManager;

    move-result-object v3

    sget-object v4, Lcom/disney/id/android/localization/DIDLocalizationManager;->TAG:Ljava/lang/String;

    invoke-virtual {v3, v1, v4}, Lcom/disney/id/android/volley/VolleyManager;->addToRequestQueue(Lcom/disney/id/android/volley/Request;Ljava/lang/String;)V

    .line 150
    .end local v1    # "req":Lcom/disney/id/android/localization/L10nRequest;
    :cond_4
    return-void
.end method

.method private loadFromRaw(Ljava/lang/String;)V
    .locals 8
    .param p1, "loadLangPref"    # Ljava/lang/String;

    .prologue
    .line 154
    :try_start_0
    invoke-direct {p0, p1}, Lcom/disney/id/android/localization/DIDLocalizationManager;->getDbIdentifier(Ljava/lang/String;)I

    move-result v2

    .line 155
    .local v2, "id":I
    if-nez v2, :cond_0

    .line 156
    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getDefaultLanguagePreference()Ljava/lang/String;

    move-result-object p1

    .line 157
    invoke-direct {p0, p1}, Lcom/disney/id/android/localization/DIDLocalizationManager;->getDbIdentifier(Ljava/lang/String;)I

    move-result v2

    .line 159
    :cond_0
    iget-object v5, p0, Lcom/disney/id/android/localization/DIDLocalizationManager;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v4

    .line 160
    .local v4, "stream":Ljava/io/InputStream;
    if-eqz v4, :cond_1

    .line 161
    invoke-virtual {v4}, Ljava/io/InputStream;->available()I

    move-result v3

    .line 162
    .local v3, "size":I
    new-array v0, v3, [B

    .line 163
    .local v0, "bytes":[B
    invoke-virtual {v4, v0}, Ljava/io/InputStream;->read([B)I

    .line 164
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 166
    new-instance v5, Lorg/json/JSONObject;

    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v0}, Ljava/lang/String;-><init>([B)V

    invoke-direct {v5, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v5, p0, Lcom/disney/id/android/localization/DIDLocalizationManager;->db:Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_2

    .line 175
    .end local v0    # "bytes":[B
    .end local v2    # "id":I
    .end local v3    # "size":I
    .end local v4    # "stream":Ljava/io/InputStream;
    :cond_1
    :goto_0
    return-void

    .line 168
    :catch_0
    move-exception v1

    .line 169
    .local v1, "e":Lorg/json/JSONException;
    sget-object v5, Lcom/disney/id/android/localization/DIDLocalizationManager;->TAG:Ljava/lang/String;

    invoke-static {v5}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 170
    .end local v1    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v1

    .line 171
    .local v1, "e":Ljava/io/IOException;
    sget-object v5, Lcom/disney/id/android/localization/DIDLocalizationManager;->TAG:Ljava/lang/String;

    invoke-static {v5}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "Problems reading localized database"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 172
    .end local v1    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v1

    .line 173
    .local v1, "e":Landroid/content/res/Resources$NotFoundException;
    sget-object v5, Lcom/disney/id/android/localization/DIDLocalizationManager;->TAG:Ljava/lang/String;

    invoke-static {v5}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "Localized database not found"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public getMessage(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "textId"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/disney/id/android/localization/DIDLocalizationManager;->getMobileJSON()Lorg/json/JSONObject;

    move-result-object v0

    .line 43
    .local v0, "mobile":Lorg/json/JSONObject;
    if-eqz v0, :cond_0

    const-string v1, "message"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 45
    :try_start_0
    const-string v1, "message"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p1

    .line 49
    .end local p1    # "textId":Ljava/lang/String;
    :goto_0
    return-object p1

    .line 46
    .restart local p1    # "textId":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 48
    :cond_0
    sget-object v1, Lcom/disney/id/android/localization/DIDLocalizationManager;->TAG:Ljava/lang/String;

    invoke-static {v1}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Translation failed to lookup: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public hasMessageText(Ljava/lang/String;)Z
    .locals 4
    .param p1, "textId"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 53
    invoke-direct {p0}, Lcom/disney/id/android/localization/DIDLocalizationManager;->getMobileJSON()Lorg/json/JSONObject;

    move-result-object v1

    .line 54
    .local v1, "mobile":Lorg/json/JSONObject;
    if-eqz v1, :cond_0

    const-string v3, "message"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 56
    :try_start_0
    const-string v3, "message"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "message"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    .line 61
    :cond_0
    :goto_0
    return v2

    .line 57
    :catch_0
    move-exception v0

    .line 58
    .local v0, "ignore":Lorg/json/JSONException;
    goto :goto_0
.end method

.method public initialize(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 81
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/localization/DIDLocalizationManager;->mContext:Landroid/content/Context;

    .line 82
    invoke-virtual {p0}, Lcom/disney/id/android/localization/DIDLocalizationManager;->load()V

    .line 83
    return-void
.end method

.method public load()V
    .locals 2

    .prologue
    .line 89
    iget-object v1, p0, Lcom/disney/id/android/localization/DIDLocalizationManager;->mContext:Landroid/content/Context;

    if-nez v1, :cond_0

    .line 94
    :goto_0
    return-void

    .line 91
    :cond_0
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->hasProfile()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getProfile()Lcom/disney/id/android/DIDProfile;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDProfile;->hasAgeBand()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getProfile()Lcom/disney/id/android/DIDProfile;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDProfile;->getAgeBand()Ljava/lang/String;

    move-result-object v0

    .line 93
    .local v0, "ageBand":Ljava/lang/String;
    :goto_1
    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getLanguagePreference()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/disney/id/android/localization/DIDLocalizationManager;->loadFromL10N(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 91
    .end local v0    # "ageBand":Ljava/lang/String;
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method
