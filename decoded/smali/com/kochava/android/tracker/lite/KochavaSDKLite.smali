.class public Lcom/kochava/android/tracker/lite/KochavaSDKLite;
.super Ljava/lang/Object;
.source "KochavaSDKLite.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/kochava/android/tracker/lite/KochavaSDKLite$CURRENCIES;,
        Lcom/kochava/android/tracker/lite/KochavaSDKLite$INPUTITEMS;,
        Lcom/kochava/android/tracker/lite/KochavaSDKLite$PARAMS;
    }
.end annotation


# static fields
.field protected static final ATTRIBUTION_ID_COLUMN_NAME:Ljava/lang/String; = "aid"

.field protected static final ATTRIBUTION_ID_CONTENT_URI:Landroid/net/Uri;

.field private static final KOCHAVA_DEVICE_ID_GENERATED:Ljava/lang/String; = "kochava_app_id_generated"

.field protected static final PREF_INIT_DATA:Ljava/lang/String; = "shimInitData"

.field protected static final PREF_NAME:Ljava/lang/String; = "initPrefs"

.field private static final TAG:Ljava/lang/String; = "KochavaSDKLite"

.field protected static adid:Ljava/lang/String;

.field private static advertisingID:Ljava/lang/String;

.field private static device_limit_tracking:Z

.field protected static gotadid:Z

.field protected static height:Ljava/lang/String;

.field protected static initialized:Z

.field static isFinished:Z

.field protected static kochava_device_strat:Ljava/lang/String;

.field static lock:Ljava/lang/Object;

.field private static mAppName:Ljava/lang/String;

.field private static mAppPackageName:Ljava/lang/String;

.field private static mAppVersionCode:Ljava/lang/String;

.field private static mAppVersionName:Ljava/lang/String;

.field protected static mContext:Landroid/content/Context;

.field private static prefs:Landroid/content/SharedPreferences;

.field private static test:I

.field protected static userAgent:Ljava/lang/String;

.field private static userAgentResult:Ljava/lang/String;

.field protected static width:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 48
    const-string v0, "content://com.facebook.katana.provider.AttributionIdProvider"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 47
    sput-object v0, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->ATTRIBUTION_ID_CONTENT_URI:Landroid/net/Uri;

    .line 57
    const-string v0, ""

    sput-object v0, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->kochava_device_strat:Ljava/lang/String;

    .line 58
    const-string v0, ""

    sput-object v0, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->height:Ljava/lang/String;

    .line 59
    const-string v0, ""

    sput-object v0, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->width:Ljava/lang/String;

    .line 61
    sput-boolean v1, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->device_limit_tracking:Z

    .line 63
    sput-boolean v1, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->initialized:Z

    .line 65
    const/4 v0, 0x2

    sput v0, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->test:I

    .line 67
    sput-boolean v1, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->gotadid:Z

    .line 68
    const-string v0, ""

    sput-object v0, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->userAgent:Ljava/lang/String;

    .line 70
    const-string v0, ""

    sput-object v0, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mAppName:Ljava/lang/String;

    .line 71
    const-string v0, ""

    sput-object v0, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mAppVersionCode:Ljava/lang/String;

    .line 72
    const-string v0, ""

    sput-object v0, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mAppVersionName:Ljava/lang/String;

    .line 73
    const-string v0, ""

    sput-object v0, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mAppPackageName:Ljava/lang/String;

    .line 75
    const-string v0, ""

    sput-object v0, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->adid:Ljava/lang/String;

    .line 81
    const-string v0, ""

    sput-object v0, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->userAgentResult:Ljava/lang/String;

    .line 85
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->lock:Ljava/lang/Object;

    .line 88
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static AndroidID()Ljava/lang/String;
    .locals 5

    .prologue
    .line 145
    const-string v1, ""

    .line 149
    .local v1, "result":Ljava/lang/String;
    :try_start_0
    sget-object v2, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "android_id"

    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 156
    :cond_0
    :goto_0
    if-nez v1, :cond_1

    const-string v1, ""

    .end local v1    # "result":Ljava/lang/String;
    :cond_1
    return-object v1

    .line 151
    .restart local v1    # "result":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 153
    .local v0, "exc":Ljava/lang/Exception;
    sget-boolean v2, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v2, :cond_0

    const-string v2, "KochavaSDKLite"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Error getting Android ID"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected static Env_Hash()Ljava/lang/String;
    .locals 3

    .prologue
    .line 258
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "-"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected static FacebookAttributionId()Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 264
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "aid"

    aput-object v1, v2, v0

    .line 265
    .local v2, "projection":[Ljava/lang/String;
    sget-object v0, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->ATTRIBUTION_ID_CONTENT_URI:Landroid/net/Uri;

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 267
    .local v7, "c":Landroid/database/Cursor;
    if-eqz v7, :cond_0

    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-nez v0, :cond_2

    .line 269
    :cond_0
    const-string v6, ""

    .line 273
    :cond_1
    :goto_0
    return-object v6

    .line 271
    :cond_2
    const-string v0, "aid"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 273
    .local v6, "attributionId":Ljava/lang/String;
    if-nez v6, :cond_1

    const-string v6, ""

    goto :goto_0
.end method

.method public static GetExternalKochavaDeviceIdentifiers_Android(Landroid/content/Context;Z)Ljava/lang/String;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "suppressAdid"    # Z

    .prologue
    .line 245
    sget-boolean v1, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->initialized:Z

    if-nez v1, :cond_0

    .line 246
    invoke-static {p0, p1}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->init(Landroid/content/Context;Z)V

    .line 248
    :cond_0
    const-string v0, "{"

    .line 249
    .local v0, "result":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "user_agent"

    sget-object v3, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->userAgent:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->formatJsonPair(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 250
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "kochava_device_id"

    invoke-static {}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->KochavaDeviceId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->formatJsonPair(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 251
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "unity_shim_version"

    const-string v3, "AndroidLite20150310"

    invoke-static {v2, v3}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->formatJsonPair(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 252
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "}"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 253
    return-object v0
.end method

.method public static GetExternalKochavaInfo_Android(Landroid/content/Context;Ljava/lang/String;IZZ)Ljava/lang/String;
    .locals 11
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "whitelist"    # Ljava/lang/String;
    .param p2, "device_id_wait"    # I
    .param p3, "adidBlacklisted"    # Z
    .param p4, "adidSuppressed"    # Z

    .prologue
    .line 519
    const/4 v5, 0x0

    .line 521
    .local v5, "shouldSendEmails":Z
    const-string v8, "KochavaSDKLite"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "Got whitelist: "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 524
    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_0

    .line 527
    const-string v8, "{"

    invoke-virtual {p1, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    add-int/lit8 v8, v8, 0x1

    const-string v9, "}"

    invoke-virtual {p1, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {p1, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 528
    .local v3, "list_string":Ljava/lang/String;
    const-string v8, "\\s*,\\s*"

    invoke-virtual {v3, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    .line 529
    .local v7, "whitelistItems":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v7}, Ljava/util/List;->size()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 531
    .local v2, "length":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-lt v1, v2, :cond_2

    .line 544
    .end local v1    # "i":I
    .end local v2    # "length":I
    .end local v3    # "list_string":Ljava/lang/String;
    .end local v7    # "whitelistItems":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_0
    :goto_1
    move v4, v5

    .line 551
    .local v4, "sendEmails":Z
    :try_start_1
    invoke-static {}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->FacebookAttributionId()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 558
    :goto_2
    if-nez p0, :cond_4

    .line 560
    sget-boolean v8, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v8, :cond_1

    const-string v8, "KochavaSDKLite"

    const-string v9, "Context you passed was null, cannot get identifiers."

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 561
    :cond_1
    const-string v8, ""

    .line 686
    :goto_3
    return-object v8

    .line 533
    .end local v4    # "sendEmails":Z
    .restart local v1    # "i":I
    .restart local v2    # "length":I
    .restart local v3    # "list_string":Ljava/lang/String;
    .restart local v7    # "whitelistItems":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_2
    :try_start_2
    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v8

    const-string v9, "email"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-result v8

    if-eqz v8, :cond_3

    .line 535
    const/4 v5, 0x1

    .line 531
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 540
    .end local v1    # "i":I
    .end local v2    # "length":I
    .end local v3    # "list_string":Ljava/lang/String;
    .end local v7    # "whitelistItems":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_0
    move-exception v0

    .line 542
    .local v0, "e1":Ljava/lang/Exception;
    sget-boolean v8, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v8, :cond_0

    const-string v8, "KochavaSDKLite"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "Problem parsing whitelist: "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 564
    .end local v0    # "e1":Ljava/lang/Exception;
    .restart local v4    # "sendEmails":Z
    :cond_4
    sget-boolean v8, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->initialized:Z

    if-nez v8, :cond_5

    .line 565
    invoke-static {p0, p4}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->init(Landroid/content/Context;Z)V

    .line 567
    :cond_5
    new-instance v6, Lcom/kochava/android/tracker/lite/KochavaSDKLite$2;

    invoke-direct {v6, p2, p3, p4, v4}, Lcom/kochava/android/tracker/lite/KochavaSDKLite$2;-><init>(IZZZ)V

    .line 684
    .local v6, "t":Ljava/lang/Thread;
    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 686
    const-string v8, ""

    goto :goto_3

    .line 553
    .end local v6    # "t":Ljava/lang/Thread;
    :catch_1
    move-exception v8

    goto :goto_2
.end method

.method protected static KochavaDeviceId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 240
    const-string v0, ""

    return-object v0
.end method

.method protected static Mac()Ljava/lang/String;
    .locals 6

    .prologue
    .line 211
    const-string v1, ""

    .line 215
    .local v1, "result":Ljava/lang/String;
    :try_start_0
    sget-object v3, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mContext:Landroid/content/Context;

    const-string v4, "wifi"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/wifi/WifiManager;

    .line 216
    .local v2, "wimanager":Landroid/net/wifi/WifiManager;
    invoke-virtual {v2}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/wifi/WifiInfo;->getMacAddress()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 224
    .end local v2    # "wimanager":Landroid/net/wifi/WifiManager;
    :cond_0
    :goto_0
    if-nez v1, :cond_1

    const-string v1, ""

    .end local v1    # "result":Ljava/lang/String;
    :cond_1
    return-object v1

    .line 218
    .restart local v1    # "result":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 220
    .local v0, "exc":Ljava/lang/Exception;
    sget-boolean v3, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v3, :cond_0

    const-string v3, "KochavaSDKLite"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Error getting Mac Address: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected static ODIN()Ljava/lang/String;
    .locals 13

    .prologue
    .line 161
    const-string v6, ""

    .line 165
    .local v6, "result":Ljava/lang/String;
    :try_start_0
    invoke-static {}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->Mac()Ljava/lang/String;

    move-result-object v4

    .line 166
    .local v4, "mMacAddr":Ljava/lang/String;
    if-eqz v4, :cond_0

    const-string v10, ""

    invoke-virtual {v10, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 172
    const-string v10, "SHA-1"

    invoke-static {v10}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v5

    .line 173
    .local v5, "md":Ljava/security/MessageDigest;
    const/16 v10, 0x28

    new-array v7, v10, [B

    .line 174
    .local v7, "sha1hash":[B
    const-string v10, "iso-8859-1"

    invoke-virtual {v4, v10}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v12

    invoke-virtual {v5, v10, v11, v12}, Ljava/security/MessageDigest;->update([BII)V

    .line 175
    invoke-virtual {v5}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v7

    .line 179
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 180
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v10, v7

    if-lt v3, v10, :cond_2

    .line 195
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 206
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    .end local v3    # "i":I
    .end local v4    # "mMacAddr":Ljava/lang/String;
    .end local v5    # "md":Ljava/security/MessageDigest;
    .end local v7    # "sha1hash":[B
    :cond_0
    :goto_1
    if-nez v6, :cond_1

    const-string v6, ""

    .end local v6    # "result":Ljava/lang/String;
    :cond_1
    return-object v6

    .line 182
    .restart local v0    # "buf":Ljava/lang/StringBuffer;
    .restart local v3    # "i":I
    .restart local v4    # "mMacAddr":Ljava/lang/String;
    .restart local v5    # "md":Ljava/security/MessageDigest;
    .restart local v6    # "result":Ljava/lang/String;
    .restart local v7    # "sha1hash":[B
    :cond_2
    :try_start_1
    aget-byte v10, v7, v3

    ushr-int/lit8 v10, v10, 0x4

    and-int/lit8 v2, v10, 0xf

    .line 183
    .local v2, "halfbyte":I
    const/4 v8, 0x0

    .local v8, "two_halfs":I
    move v9, v8

    .line 186
    .end local v8    # "two_halfs":I
    .local v9, "two_halfs":I
    :goto_2
    if-ltz v2, :cond_3

    const/16 v10, 0x9

    if-gt v2, v10, :cond_3

    .line 187
    add-int/lit8 v10, v2, 0x30

    int-to-char v10, v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 191
    :goto_3
    aget-byte v10, v7, v3

    and-int/lit8 v2, v10, 0xf

    .line 192
    add-int/lit8 v8, v9, 0x1

    .end local v9    # "two_halfs":I
    .restart local v8    # "two_halfs":I
    const/4 v10, 0x1

    .line 184
    if-lt v9, v10, :cond_4

    .line 180
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 189
    .end local v8    # "two_halfs":I
    .restart local v9    # "two_halfs":I
    :cond_3
    add-int/lit8 v10, v2, -0xa

    add-int/lit8 v10, v10, 0x61

    int-to-char v10, v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    .line 200
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    .end local v2    # "halfbyte":I
    .end local v3    # "i":I
    .end local v4    # "mMacAddr":Ljava/lang/String;
    .end local v5    # "md":Ljava/security/MessageDigest;
    .end local v7    # "sha1hash":[B
    .end local v9    # "two_halfs":I
    :catch_0
    move-exception v1

    .line 202
    .local v1, "exc":Ljava/lang/Exception;
    sget-boolean v10, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v10, :cond_0

    const-string v10, "KochavaSDKLite"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "Error getting ODIN: "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .end local v1    # "exc":Ljava/lang/Exception;
    .restart local v0    # "buf":Ljava/lang/StringBuffer;
    .restart local v2    # "halfbyte":I
    .restart local v3    # "i":I
    .restart local v4    # "mMacAddr":Ljava/lang/String;
    .restart local v5    # "md":Ljava/security/MessageDigest;
    .restart local v7    # "sha1hash":[B
    .restart local v8    # "two_halfs":I
    :cond_4
    move v9, v8

    .end local v8    # "two_halfs":I
    .restart local v9    # "two_halfs":I
    goto :goto_2
.end method

.method protected static PackageName()Ljava/lang/String;
    .locals 5

    .prologue
    .line 128
    const-string v1, ""

    .line 132
    .local v1, "result":Ljava/lang/String;
    :try_start_0
    sget-object v2, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    sget-object v3, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    iget-object v1, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    :cond_0
    :goto_0
    if-nez v1, :cond_1

    const-string v1, ""

    .end local v1    # "result":Ljava/lang/String;
    :cond_1
    return-object v1

    .line 134
    .restart local v1    # "result":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 136
    .local v0, "exc":Ljava/lang/Exception;
    sget-boolean v2, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v2, :cond_0

    const-string v2, "KochavaSDKLite"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Error getting Package Name"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method static synthetic access$0()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1042
    invoke-static {}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->getAdvertisingId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 88
    sput-object p0, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->advertisingID:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$10(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 883
    invoke-static {p0}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->hideString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2()Landroid/content/SharedPreferences;
    .locals 1

    .prologue
    .line 53
    sget-object v0, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->prefs:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method static synthetic access$3()Ljava/lang/String;
    .locals 1

    .prologue
    .line 88
    sget-object v0, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->advertisingID:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$4(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 873
    invoke-static {p0, p1}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->formatJsonPair(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$5()Ljava/lang/String;
    .locals 1

    .prologue
    .line 954
    invoke-static {}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->getAppVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$6()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1002
    invoke-static {}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->getAppShortString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$7()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1124
    invoke-static {}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->getEmailAccounts()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$8()Z
    .locals 1

    .prologue
    .line 61
    sget-boolean v0, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->device_limit_tracking:Z

    return v0
.end method

.method static synthetic access$9()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1024
    invoke-static {}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->getLanguage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static enableDebug(Z)V
    .locals 0
    .param p0, "enabled"    # Z

    .prologue
    .line 880
    sput-boolean p0, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    .line 881
    return-void
.end method

.method private static formatJsonPair(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 875
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\":\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getAdvertisingId()Ljava/lang/String;
    .locals 7

    .prologue
    .line 1083
    :try_start_0
    sget-object v4, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v2

    .line 1084
    .local v2, "availableCode":I
    if-eqz v2, :cond_1

    .line 1087
    packed-switch v2, :pswitch_data_0

    .line 1099
    :pswitch_0
    sget-boolean v4, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v4, :cond_0

    const-string v4, "KochavaSDKLite"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Google Play Services check returned unknown error code ("

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1103
    :cond_0
    :goto_0
    sget-boolean v4, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v4, :cond_1

    const-string v4, "KochavaSDKLite"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Problem getting Advertising ID "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->getErrorString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1107
    :cond_1
    const/4 v0, 0x0

    .line 1110
    .local v0, "adInfo":Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;
    sget-object v4, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;->getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;

    move-result-object v0

    .line 1111
    invoke-virtual {v0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->getId()Ljava/lang/String;

    move-result-object v1

    .line 1112
    .local v1, "adid":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;->isLimitAdTrackingEnabled()Z

    move-result v4

    sput-boolean v4, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->device_limit_tracking:Z

    .line 1121
    .end local v0    # "adInfo":Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;
    .end local v1    # "adid":Ljava/lang/String;
    :goto_1
    return-object v1

    .line 1089
    :pswitch_1
    sget-boolean v4, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v4, :cond_0

    const-string v4, "KochavaSDKLite"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Google Play Services check returned ConnectionResult.SUCCESS ("

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1116
    :catch_0
    move-exception v3

    .line 1118
    .local v3, "e":Ljava/lang/Exception;
    sget-boolean v4, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v4, :cond_2

    const-string v4, "KochavaSDKLite"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Problem getting Advertising ID (catch): "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1121
    :cond_2
    const-string v1, ""

    goto :goto_1

    .line 1091
    .end local v3    # "e":Ljava/lang/Exception;
    :pswitch_2
    :try_start_1
    sget-boolean v4, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v4, :cond_0

    const-string v4, "KochavaSDKLite"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Google Play Services check returned ConnectionResult.SERVICE_MISSING ("

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1093
    :pswitch_3
    sget-boolean v4, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v4, :cond_0

    const-string v4, "KochavaSDKLite"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Google Play Services check returned ConnectionResult.SERVICE_VERSION_UPDATE_REQUIRED ("

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1095
    :pswitch_4
    sget-boolean v4, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v4, :cond_0

    const-string v4, "KochavaSDKLite"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Google Play Services check returned ConnectionResult.SERVICE_DISABLED ("

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1097
    :pswitch_5
    sget-boolean v4, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v4, :cond_0

    const-string v4, "KochavaSDKLite"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Google Play Services check returned ConnectionResult.SERVICE_INVALID ("

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 1087
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
    .end packed-switch
.end method

.method private static getAppShortString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 1004
    const-string v1, ""

    .line 1008
    .local v1, "result":Ljava/lang/String;
    :try_start_0
    sget-object v2, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    sget-object v3, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    sput-object v2, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mAppVersionName:Ljava/lang/String;

    .line 1009
    sget-object v1, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mAppVersionName:Ljava/lang/String;

    .line 1010
    sget-boolean v2, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v2, :cond_0

    const-string v2, "KochavaSDKLite"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "mAppVersionName now: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v4, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mAppVersionName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1020
    :cond_0
    :goto_0
    if-nez v1, :cond_1

    const-string v1, ""

    .end local v1    # "result":Ljava/lang/String;
    :cond_1
    return-object v1

    .line 1012
    .restart local v1    # "result":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 1014
    .local v0, "e":Ljava/lang/Exception;
    sget-boolean v2, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v2, :cond_0

    .line 1015
    const-string v2, "KochavaSDKLite"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Error gathering app version name "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static getAppVersion()Ljava/lang/String;
    .locals 7

    .prologue
    .line 957
    const-string v3, "Default"

    sput-object v3, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mAppName:Ljava/lang/String;

    .line 958
    const-string v3, "N/A"

    sput-object v3, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mAppVersionCode:Ljava/lang/String;

    .line 959
    const-string v3, ""

    sput-object v3, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mAppVersionName:Ljava/lang/String;

    .line 963
    :try_start_0
    sget-object v3, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v2

    .line 967
    .local v2, "pm":Landroid/content/pm/PackageManager;
    :try_start_1
    sget-object v3, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    .line 976
    .local v0, "ai":Landroid/content/pm/ApplicationInfo;
    :cond_0
    :goto_0
    if-eqz v0, :cond_3

    :try_start_2
    invoke-virtual {v2, v0}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v3

    :goto_1
    check-cast v3, Ljava/lang/String;

    sput-object v3, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mAppName:Ljava/lang/String;

    .line 978
    sget-boolean v3, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v3, :cond_1

    const-string v3, "KochavaSDKLite"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "mAppName now: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v5, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mAppName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 988
    .end local v0    # "ai":Landroid/content/pm/ApplicationInfo;
    :cond_1
    :goto_2
    :try_start_3
    new-instance v3, Ljava/lang/StringBuilder;

    sget-object v4, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    sget-object v5, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v4

    iget v4, v4, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mAppVersionCode:Ljava/lang/String;

    .line 989
    sget-boolean v3, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v3, :cond_2

    const-string v3, "KochavaSDKLite"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "mAppVersionCode now: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v5, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mAppVersionCode:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 998
    :cond_2
    :goto_3
    new-instance v3, Ljava/lang/StringBuilder;

    sget-object v4, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mAppName:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mAppVersionCode:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 969
    :catch_0
    move-exception v1

    .line 971
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v0, 0x0

    .line 972
    .restart local v0    # "ai":Landroid/content/pm/ApplicationInfo;
    :try_start_4
    sget-boolean v3, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v3, :cond_0

    .line 973
    const-string v3, "KochavaSDKLite"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Error gathering app name "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Landroid/content/pm/PackageManager$NameNotFoundException;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_0

    .line 980
    .end local v0    # "ai":Landroid/content/pm/ApplicationInfo;
    .end local v1    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_1
    move-exception v1

    .line 982
    .local v1, "e":Ljava/lang/Exception;
    sget-boolean v3, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v3, :cond_1

    .line 983
    const-string v3, "KochavaSDKLite"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Error gathering app name "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Exception;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 976
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "ai":Landroid/content/pm/ApplicationInfo;
    :cond_3
    :try_start_5
    const-string v3, "(unknown)"
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto/16 :goto_1

    .line 991
    .end local v0    # "ai":Landroid/content/pm/ApplicationInfo;
    :catch_2
    move-exception v1

    .line 993
    .restart local v1    # "e":Ljava/lang/Exception;
    sget-boolean v3, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v3, :cond_2

    .line 994
    const-string v3, "KochavaSDKLite"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Error gathering app version code "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Exception;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3
.end method

.method private static getEmailAccounts()Ljava/lang/String;
    .locals 10

    .prologue
    const/4 v6, 0x0

    .line 1127
    const-string v4, ""

    .line 1128
    .local v4, "email":Ljava/lang/String;
    sget-object v5, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mContext:Landroid/content/Context;

    const-string v7, "android.permission.GET_ACCOUNTS"

    invoke-virtual {v5, v7}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v3

    .line 1130
    .local v3, "check":I
    const-string v1, ""

    .line 1133
    .local v1, "accountHolder":Ljava/lang/String;
    if-nez v3, :cond_4

    .line 1135
    sget-object v5, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mContext:Landroid/content/Context;

    invoke-static {v5}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v5

    invoke-virtual {v5}, Landroid/accounts/AccountManager;->getAccounts()[Landroid/accounts/Account;

    move-result-object v2

    .line 1136
    .local v2, "accounts":[Landroid/accounts/Account;
    array-length v7, v2

    move v5, v6

    :goto_0
    if-lt v5, v7, :cond_1

    .line 1150
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_3

    .line 1151
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 1164
    .end local v2    # "accounts":[Landroid/accounts/Account;
    :cond_0
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "["

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1165
    return-object v4

    .line 1136
    .restart local v2    # "accounts":[Landroid/accounts/Account;
    :cond_1
    aget-object v0, v2, v5

    .line 1138
    .local v0, "account":Landroid/accounts/Account;
    iget-object v8, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-static {v8}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->isEmailValid(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 1143
    iget-object v8, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 1144
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ","

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1136
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 1153
    .end local v0    # "account":Landroid/accounts/Account;
    :cond_3
    const-string v4, ""

    .line 1154
    goto :goto_1

    .line 1157
    .end local v2    # "accounts":[Landroid/accounts/Account;
    :cond_4
    const-string v4, ""

    .line 1158
    sget-boolean v5, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v5, :cond_0

    const-string v5, "KochavaSDKLite"

    const-string v6, "****NOTICE**** Gathering of emails was whitelisted, but android.permission.GET_ACCOUNTS declaration was missing from manifest."

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private static getLanguage()Ljava/lang/String;
    .locals 5

    .prologue
    .line 1026
    const-string v1, ""

    .line 1030
    .local v1, "result":Ljava/lang/String;
    :try_start_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 1039
    :cond_0
    :goto_0
    if-nez v1, :cond_1

    const-string v1, ""

    .end local v1    # "result":Ljava/lang/String;
    :cond_1
    return-object v1

    .line 1032
    .restart local v1    # "result":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 1034
    .local v0, "e":Ljava/lang/Exception;
    sget-boolean v2, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v2, :cond_0

    const-string v2, "KochavaSDKLite"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Error gathering language code: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected static getMetrics()V
    .locals 5

    .prologue
    .line 282
    :try_start_0
    sget-object v2, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mContext:Landroid/content/Context;

    const-string v3, "window"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    .line 283
    .local v1, "wm":Landroid/view/WindowManager;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Display;->getHeight()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->height:Ljava/lang/String;

    .line 284
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Display;->getWidth()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->width:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 290
    :cond_0
    :goto_0
    return-void

    .line 286
    :catch_0
    move-exception v0

    .line 288
    .local v0, "exc":Ljava/lang/Exception;
    sget-boolean v2, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v2, :cond_0

    const-string v2, "KochavaSDKLite"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Error getting Device height/width metrics: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static getUserAgentLog()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1261
    sget-object v0, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->userAgentResult:Ljava/lang/String;

    return-object v0
.end method

.method private static hideString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "in"    # Ljava/lang/String;

    .prologue
    .line 885
    if-nez p0, :cond_0

    .line 886
    const/4 v1, 0x0

    .line 890
    :goto_0
    return-object v1

    .line 888
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    new-array v0, v1, [C

    .line 889
    .local v0, "string":[C
    const/16 v1, 0x2a

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([CC)V

    .line 890
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([C)V

    goto :goto_0
.end method

.method protected static init(Landroid/content/Context;Z)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "suppressAdid"    # Z

    .prologue
    .line 93
    sput-object p0, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mContext:Landroid/content/Context;

    .line 95
    sget-object v1, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mContext:Landroid/content/Context;

    const-string v2, "initPrefs"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    sput-object v1, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->prefs:Landroid/content/SharedPreferences;

    .line 97
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->setUserAgent(Landroid/content/Context;)V

    .line 99
    if-nez p1, :cond_0

    .line 101
    new-instance v0, Lcom/kochava/android/tracker/lite/KochavaSDKLite$1;

    invoke-direct {v0}, Lcom/kochava/android/tracker/lite/KochavaSDKLite$1;-><init>()V

    .line 120
    .local v0, "getAdid":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 122
    .end local v0    # "getAdid":Ljava/lang/Thread;
    :cond_0
    const/4 v1, 0x1

    sput-boolean v1, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->initialized:Z

    .line 123
    return-void
.end method

.method private static isEmailValid(Ljava/lang/String;)Z
    .locals 6
    .param p0, "email"    # Ljava/lang/String;

    .prologue
    .line 1171
    const/4 v2, 0x0

    .line 1173
    .local v2, "isValid":Z
    const-string v0, "^[\\w\\.-]+@([\\w\\-]+\\.)+[A-Z]{2,4}$"

    .line 1174
    .local v0, "expression":Ljava/lang/String;
    move-object v1, p0

    .line 1176
    .local v1, "inputStr":Ljava/lang/CharSequence;
    const/4 v5, 0x2

    invoke-static {v0, v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v4

    .line 1177
    .local v4, "pattern":Ljava/util/regex/Pattern;
    invoke-virtual {v4, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 1178
    .local v3, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1179
    const/4 v2, 0x1

    .line 1181
    :cond_0
    return v2
.end method

.method private static parseInput(Ljava/util/HashMap;)Ljava/lang/String;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .local p0, "input":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v5, 0x0

    .line 895
    const-string v4, ""

    .line 896
    .local v4, "result":Ljava/lang/String;
    const-string v6, "partner_id"

    invoke-virtual {p0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 897
    .local v2, "partner_id":Ljava/lang/String;
    const-string v6, "partner_name"

    invoke-virtual {p0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 898
    .local v3, "partner_name":Ljava/lang/String;
    const-string v6, "kochava_app_id"

    invoke-virtual {p0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 899
    .local v0, "app_id":Ljava/lang/String;
    const-string v6, "currency"

    invoke-virtual {p0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 901
    .local v1, "currency":Ljava/lang/String;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_5

    :cond_0
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_5

    .line 906
    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_4

    .line 910
    :cond_2
    sget-boolean v6, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v6, :cond_3

    const-string v6, "KochavaSDKLite"

    const-string v7, "Kochava requires that you pass either a kochava app id, or a partner id and a partner name into the datamap during initialization."

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 951
    :cond_3
    :goto_0
    return-object v5

    .line 915
    :cond_4
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "kochava_app_id"

    invoke-static {v6, v0}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->formatJsonPair(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 940
    :goto_1
    if-eqz v1, :cond_9

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_9

    .line 942
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "\"currency\":\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_2
    move-object v5, v4

    .line 951
    goto :goto_0

    .line 918
    :cond_5
    if-eqz v2, :cond_6

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_6

    if-eqz v3, :cond_6

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_7

    .line 921
    :cond_6
    sget-boolean v6, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v6, :cond_3

    const-string v6, "KochavaSDKLite"

    const-string v7, "Please make sure that you have passed both a partner id and a partner name."

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 927
    :cond_7
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "partner_id"

    invoke-static {v6, v2}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->formatJsonPair(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 928
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "partner_name"

    invoke-static {v6, v3}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->formatJsonPair(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 930
    if-eqz v0, :cond_8

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_8

    .line 932
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "kochava_app_id"

    invoke-static {v6, v0}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->formatJsonPair(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 933
    goto/16 :goto_1

    .line 936
    :cond_8
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "kochava_app_id"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "_p:"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ":"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->formatJsonPair(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_1

    .line 947
    :cond_9
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "\"currency\":\"USD\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_2
.end method

.method protected static setUserAgent(Landroid/content/Context;)V
    .locals 15
    .param p0, "context"    # Landroid/content/Context;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 295
    const-string v10, ""

    .line 297
    .local v10, "userAgentResult":Ljava/lang/String;
    const/4 v4, 0x1

    .line 298
    .local v4, "methodOneSuccess":Z
    const/4 v5, 0x1

    .line 302
    .local v5, "methodTwoSuccess":Z
    :try_start_0
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "\nTrying user agent method 1"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 303
    const-string v11, "http.agent"

    invoke-static {v11}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    sput-object v11, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->userAgent:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 315
    :goto_0
    sget-object v11, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->userAgent:Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 316
    const/4 v4, 0x0

    .line 319
    :cond_0
    if-nez v4, :cond_1

    .line 323
    :try_start_1
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "\nTrying user agent method 2"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 324
    new-instance v11, Landroid/webkit/WebView;

    sget-object v12, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mContext:Landroid/content/Context;

    invoke-direct {v11, v12}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v11}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v11

    invoke-virtual {v11}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    move-result-object v11

    sput-object v11, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->userAgent:Ljava/lang/String;

    .line 325
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "\nMethod 2 successful"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v10

    .line 338
    :cond_1
    :goto_1
    sget-object v11, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->userAgent:Ljava/lang/String;

    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_2

    .line 339
    const/4 v5, 0x0

    .line 341
    :cond_2
    if-nez v5, :cond_3

    .line 343
    const/4 v0, 0x0

    .line 346
    .local v0, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<Landroid/webkit/WebSettings;>;"
    :try_start_2
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "\nTrying user agent method 3"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 347
    const-class v11, Landroid/webkit/WebSettings;

    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/Class;

    const/4 v13, 0x0

    const-class v14, Landroid/content/Context;

    aput-object v14, v12, v13

    const/4 v13, 0x1

    const-class v14, Landroid/webkit/WebView;

    aput-object v14, v12, v13

    invoke-virtual {v11, v12}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 348
    const/4 v11, 0x1

    invoke-virtual {v0, v11}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 349
    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    sget-object v13, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->mContext:Landroid/content/Context;

    aput-object v13, v11, v12

    const/4 v12, 0x1

    const/4 v13, 0x0

    aput-object v13, v11, v12

    invoke-virtual {v0, v11}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/webkit/WebSettings;

    .line 350
    .local v6, "settings":Landroid/webkit/WebSettings;
    invoke-virtual {v6}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    move-result-object v11

    sput-object v11, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->userAgent:Ljava/lang/String;

    .line 351
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "\nMethod 3 successful."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v10

    .line 362
    if-eqz v0, :cond_3

    .line 363
    const/4 v11, 0x0

    invoke-virtual {v0, v11}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 369
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<Landroid/webkit/WebSettings;>;"
    .end local v6    # "settings":Landroid/webkit/WebSettings;
    :cond_3
    :goto_2
    sget-boolean v11, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v11, :cond_4

    const-string v11, "KochavaSDKLite"

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "user agent result: "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 372
    :cond_4
    return-void

    .line 305
    :catch_0
    move-exception v1

    .line 308
    .local v1, "e":Ljava/lang/Exception;
    new-instance v7, Ljava/io/StringWriter;

    invoke-direct {v7}, Ljava/io/StringWriter;-><init>()V

    .line 309
    .local v7, "sw":Ljava/io/StringWriter;
    new-instance v11, Ljava/io/PrintWriter;

    invoke-direct {v11, v7}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {v1, v11}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 310
    sget-boolean v11, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v11, :cond_5

    const-string v11, "KochavaSDKLite"

    invoke-virtual {v7}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 311
    :cond_5
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "\nError with user agent first method: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v7}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    goto/16 :goto_0

    .line 327
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v7    # "sw":Ljava/io/StringWriter;
    :catch_1
    move-exception v2

    .line 330
    .local v2, "ex":Ljava/lang/Exception;
    new-instance v8, Ljava/io/StringWriter;

    invoke-direct {v8}, Ljava/io/StringWriter;-><init>()V

    .line 331
    .local v8, "sw2":Ljava/io/StringWriter;
    new-instance v11, Ljava/io/PrintWriter;

    invoke-direct {v11, v8}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {v2, v11}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 332
    sget-boolean v11, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v11, :cond_6

    const-string v11, "KochavaSDKLite"

    invoke-virtual {v8}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    :cond_6
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "\nError with user agent second method: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v8}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\n userAgent = error."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    goto/16 :goto_1

    .line 353
    .end local v2    # "ex":Ljava/lang/Exception;
    .end local v8    # "sw2":Ljava/io/StringWriter;
    .restart local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<Landroid/webkit/WebSettings;>;"
    :catch_2
    move-exception v3

    .line 355
    .local v3, "ex2":Ljava/lang/Exception;
    :try_start_3
    new-instance v9, Ljava/io/StringWriter;

    invoke-direct {v9}, Ljava/io/StringWriter;-><init>()V

    .line 356
    .local v9, "sw3":Ljava/io/StringWriter;
    new-instance v11, Ljava/io/PrintWriter;

    invoke-direct {v11, v9}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {v3, v11}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 357
    sget-boolean v11, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v11, :cond_7

    const-string v11, "KochavaSDKLite"

    invoke-virtual {v9}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 358
    :cond_7
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "\nError with user agent third method: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v9}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\n userAgent = error."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v10

    .line 362
    if-eqz v0, :cond_3

    .line 363
    const/4 v11, 0x0

    invoke-virtual {v0, v11}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    goto/16 :goto_2

    .line 361
    .end local v3    # "ex2":Ljava/lang/Exception;
    .end local v9    # "sw3":Ljava/io/StringWriter;
    :catchall_0
    move-exception v11

    .line 362
    if-eqz v0, :cond_8

    .line 363
    const/4 v12, 0x0

    invoke-virtual {v0, v12}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 364
    :cond_8
    throw v11
.end method
