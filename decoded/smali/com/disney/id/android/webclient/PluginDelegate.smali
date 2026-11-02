.class public Lcom/disney/id/android/webclient/PluginDelegate;
.super Ljava/lang/Object;
.source "PluginDelegate.java"

# interfaces
.implements Lcom/disney/id/android/DIDSessionDelegate;


# static fields
.field public static final MAIN_ACTIVITY_PROGRESS:Ljava/lang/String; = "com.disney.id.android.webclient.PluginDelegate.MAIN_ACTIVITY_PROGRESS"

.field private static final MSG_CREATED_PROFILE:I = 0x10

.field private static final MSG_LOGGED_IN:I = 0x6

.field private static final MSG_LOGGED_OUT:I = 0x7

.field private static final MSG_RESET_PROGRESS:I = 0x8

.field private static final MSG_UPDATED_PROFILE:I = 0x9

.field private static final MSG_UPDATE_UI:I = 0x12

.field static final PROMOTION_ID_EXTRA:Ljava/lang/String; = "com.disney.id.v4.webclient.PluginDelegate"

.field private static final TAG:Ljava/lang/String;

.field private static final TIME_TO_WAIT:I = 0x3e8


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    const-class v0, Lcom/disney/id/android/webclient/PluginDelegate;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private stopProgressScreen()V
    .locals 0

    .prologue
    .line 286
    return-void
.end method


# virtual methods
.method protected getLowTrustText()Ljava/lang/String;
    .locals 16

    .prologue
    .line 242
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v9

    invoke-virtual {v9}, Lcom/disney/id/android/DIDGuest;->secondsUntilLowTrust()J

    move-result-wide v6

    .line 243
    .local v6, "seconds":J
    const-string v8, ""

    .line 244
    .local v8, "text":Ljava/lang/String;
    const-wide/16 v10, 0x0

    cmp-long v9, v6, v10

    if-lez v9, :cond_0

    .line 245
    sget-object v9, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v9, v6, v7}, Ljava/util/concurrent/TimeUnit;->toHours(J)J

    move-result-wide v0

    .line 246
    .local v0, "hours":J
    sget-object v9, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v9, v6, v7}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v10

    sget-object v9, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v9, v6, v7}, Ljava/util/concurrent/TimeUnit;->toHours(J)J

    move-result-wide v12

    const-wide/16 v14, 0x3c

    mul-long/2addr v12, v14

    sub-long v2, v10, v12

    .line 247
    .local v2, "minute":J
    sget-object v9, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v9, v6, v7}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v10

    sget-object v9, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v9, v6, v7}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v12

    const-wide/16 v14, 0x3c

    mul-long/2addr v12, v14

    sub-long v4, v10, v12

    .line 248
    .local v4, "second":J
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " %d:%d:%d"

    const/4 v11, 0x3

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x1

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x2

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 250
    .end local v0    # "hours":J
    .end local v2    # "minute":J
    .end local v4    # "second":J
    :cond_0
    return-object v8
.end method

.method protected getTokenExpiresText()Ljava/lang/String;
    .locals 16

    .prologue
    .line 230
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v9

    invoke-virtual {v9}, Lcom/disney/id/android/DIDGuest;->secondsUntilTokenExpiration()J

    move-result-wide v6

    .line 231
    .local v6, "seconds":J
    const-string v8, ""

    .line 232
    .local v8, "text":Ljava/lang/String;
    const-wide/16 v10, 0x0

    cmp-long v9, v6, v10

    if-lez v9, :cond_0

    .line 233
    sget-object v9, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v9, v6, v7}, Ljava/util/concurrent/TimeUnit;->toHours(J)J

    move-result-wide v0

    .line 234
    .local v0, "hours":J
    sget-object v9, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v9, v6, v7}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v10

    sget-object v9, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v9, v6, v7}, Ljava/util/concurrent/TimeUnit;->toHours(J)J

    move-result-wide v12

    const-wide/16 v14, 0x3c

    mul-long/2addr v12, v14

    sub-long v2, v10, v12

    .line 235
    .local v2, "minute":J
    sget-object v9, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v9, v6, v7}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v10

    sget-object v9, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v9, v6, v7}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v12

    const-wide/16 v14, 0x3c

    mul-long/2addr v12, v14

    sub-long v4, v10, v12

    .line 236
    .local v4, "second":J
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " %d:%d:%d"

    const/4 v11, 0x3

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x1

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x2

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 238
    .end local v0    # "hours":J
    .end local v2    # "minute":J
    .end local v4    # "second":J
    :cond_0
    return-object v8
.end method

.method public onClose()V
    .locals 2

    .prologue
    .line 218
    sget-object v0, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v1, "Entering DID: onClose"

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 220
    return-void
.end method

.method public onCreate()V
    .locals 4

    .prologue
    .line 80
    sget-object v2, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v3, "Entering DID: onCreate"

    invoke-static {v2, v3}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    new-instance v2, Ljava/lang/Throwable;

    invoke-direct {v2}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 85
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 86
    .local v1, "j":Lorg/json/JSONObject;
    const-string v2, "guestData"

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 87
    const-string v2, "tokenData"

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDGuest;->getTokenJSON()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 89
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/disney/id/android/webclient/DisIDPlugin;->resultRegistrationSuccess(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    .end local v1    # "j":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 91
    :catch_0
    move-exception v0

    .line 92
    .local v0, "e":Lorg/json/JSONException;
    sget-object v2, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v3, "Error with Json Data"

    invoke-static {v2, v3}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 43
    sget-object v0, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    return-void
.end method

.method public onError(Lcom/disney/id/android/DIDException;)V
    .locals 2
    .param p1, "exception"    # Lcom/disney/id/android/DIDException;

    .prologue
    .line 224
    sget-object v0, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v1, "Entering DID: onError"

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 227
    return-void
.end method

.method public onForceTokenRefreshFailure(Lcom/disney/id/android/DIDException;)V
    .locals 4
    .param p1, "exception"    # Lcom/disney/id/android/DIDException;

    .prologue
    .line 174
    sget-object v2, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v3, "Entering DID: onForceTokenRefreshFailure"

    invoke-static {v2, v3}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    new-instance v2, Ljava/lang/Throwable;

    invoke-direct {v2}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 179
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 180
    .local v1, "j":Lorg/json/JSONObject;
    const-string v2, "error"

    invoke-virtual {p1}, Lcom/disney/id/android/DIDException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 181
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/disney/id/android/webclient/DisIDPlugin;->resultSilentLoginError(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    .end local v1    # "j":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 183
    :catch_0
    move-exception v0

    .line 184
    .local v0, "e":Lorg/json/JSONException;
    sget-object v2, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v3, "Error with Json Data"

    invoke-static {v2, v3}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onForceTokenRefreshSuccess()V
    .locals 4

    .prologue
    .line 152
    sget-object v2, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v3, "Entering DID: onForceTokenRefreshSuccess"

    invoke-static {v2, v3}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    new-instance v2, Ljava/lang/Throwable;

    invoke-direct {v2}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 161
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 162
    .local v1, "j":Lorg/json/JSONObject;
    const-string v2, "guestData"

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 163
    const-string v2, "tokenData"

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDGuest;->getTokenJSON()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 165
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/disney/id/android/webclient/DisIDPlugin;->resultSilentLoginSuccess(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 170
    .end local v1    # "j":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 167
    :catch_0
    move-exception v0

    .line 168
    .local v0, "e":Lorg/json/JSONException;
    sget-object v2, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v3, "Error with Json Data"

    invoke-static {v2, v3}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onLogin()V
    .locals 4

    .prologue
    .line 61
    sget-object v2, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v3, "Entering DID: onLogin"

    invoke-static {v2, v3}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    new-instance v2, Ljava/lang/Throwable;

    invoke-direct {v2}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 67
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 68
    .local v1, "j":Lorg/json/JSONObject;
    const-string v2, "guestData"

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 69
    const-string v2, "tokenData"

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDGuest;->getTokenJSON()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 71
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/disney/id/android/webclient/DisIDPlugin;->resultLoggedIn(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    .end local v1    # "j":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 72
    :catch_0
    move-exception v0

    .line 73
    .local v0, "e":Lorg/json/JSONException;
    sget-object v2, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v3, "Error with Json Data"

    invoke-static {v2, v3}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onLoginBlueFailure(Lcom/disney/id/android/DIDException;)V
    .locals 2
    .param p1, "exception"    # Lcom/disney/id/android/DIDException;

    .prologue
    .line 211
    sget-object v0, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v1, "Entering DID: onLoginBlueFailure"

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 214
    return-void
.end method

.method public onLoginBlueSuccess()V
    .locals 2

    .prologue
    .line 204
    sget-object v0, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v1, "Entering DID: onLoginBlueSuccess"

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 207
    return-void
.end method

.method public onLogout()V
    .locals 2

    .prologue
    .line 99
    sget-object v0, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v1, "Entering DID: onLogout"

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 101
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/webclient/DisIDPlugin;->resultLoggedOut()V

    .line 102
    return-void
.end method

.method public onLowTrust()V
    .locals 2

    .prologue
    .line 106
    sget-object v0, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v1, "Entering DID: onLowTrust"

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 109
    return-void
.end method

.method public onOptIn(Ljava/lang/String;)V
    .locals 2
    .param p1, "optinList"    # Ljava/lang/String;

    .prologue
    .line 113
    sget-object v0, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v1, "Entering DID: onOptIn"

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 116
    return-void
.end method

.method public onReauth()V
    .locals 2

    .prologue
    .line 120
    sget-object v0, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v1, "Entering DID: onReauth"

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 123
    invoke-virtual {p0}, Lcom/disney/id/android/webclient/PluginDelegate;->onForceTokenRefreshSuccess()V

    .line 124
    return-void
.end method

.method public onRefresh()V
    .locals 2

    .prologue
    .line 128
    sget-object v0, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v1, "Entering DID: onRefresh"

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 131
    return-void
.end method

.method public onRefreshGuestDataFailure(Lcom/disney/id/android/DIDException;)V
    .locals 2
    .param p1, "exception"    # Lcom/disney/id/android/DIDException;

    .prologue
    .line 197
    sget-object v0, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v1, "Entering DID: onRefreshGuestDataFailure"

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 200
    return-void
.end method

.method public onRefreshGuestDataSuccess()V
    .locals 2

    .prologue
    .line 190
    sget-object v0, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v1, "Entering DID: onRefreshGuestDataSuccess"

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 193
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 40
    return-void
.end method

.method public onSetup()V
    .locals 2

    .prologue
    .line 50
    sget-object v0, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v1, "Entering DID: onSetup"

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 53
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->ENV_KEY:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionConfig;->setEnv(Ljava/lang/String;)V

    .line 54
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->CLIENT_ID_KEY:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionConfig;->setClientId(Ljava/lang/String;)V

    .line 55
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->LANGUAGE_PREFERENCE_KEY:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionConfig;->setLanguagePreference(Ljava/lang/String;)V

    .line 56
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->COUNTRY_PREFERENCE_KEY:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionConfig;->setCountryPreference(Ljava/lang/String;)V

    .line 57
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    sget-boolean v0, Lcom/disney/id/android/webclient/DisIDPlugin;->DEBUG_KEY:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionConfig;->setDebug(Ljava/lang/Boolean;)V

    .line 58
    return-void
.end method

.method public onUpdate(Ljava/lang/String;)V
    .locals 4
    .param p1, "delta"    # Ljava/lang/String;

    .prologue
    .line 135
    sget-object v2, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v3, "Entering DID: onUpdate"

    invoke-static {v2, v3}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    new-instance v2, Ljava/lang/Throwable;

    invoke-direct {v2}, Ljava/lang/Throwable;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 140
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 141
    .local v1, "j":Lorg/json/JSONObject;
    const-string v2, "guestData"

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 142
    const-string v2, "tokenData"

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDGuest;->getTokenJSON()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 144
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/disney/id/android/webclient/DisIDPlugin;->resultProfileUpdateSuccess(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    .end local v1    # "j":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 145
    :catch_0
    move-exception v0

    .line 146
    .local v0, "e":Lorg/json/JSONException;
    sget-object v2, Lcom/disney/id/android/webclient/PluginDelegate;->TAG:Ljava/lang/String;

    const-string v3, "Error with Json Data"

    invoke-static {v2, v3}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
