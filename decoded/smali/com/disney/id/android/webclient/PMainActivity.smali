.class public Lcom/disney/id/android/webclient/PMainActivity;
.super Landroid/app/Activity;
.source "PMainActivity.java"

# interfaces
.implements Lcom/disney/id/android/DIDSessionDelegate;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/id/android/webclient/PMainActivity$CustomHandler;
    }
.end annotation


# static fields
.field public static final MAIN_ACTIVITY_PROGRESS:Ljava/lang/String; = "com.disney.id.android.webclient.PMainActivity.MAIN_ACTIVITY_PROGRESS"

.field private static final MSG_CREATED_PROFILE:I = 0x10

.field private static final MSG_LOGGED_IN:I = 0x6

.field private static final MSG_LOGGED_OUT:I = 0x7

.field private static final MSG_RESET_PROGRESS:I = 0x8

.field private static final MSG_UPDATED_PROFILE:I = 0x9

.field private static final MSG_UPDATE_UI:I = 0x12

.field static final PROMOTION_ID_EXTRA:Ljava/lang/String; = "com.disney.id.v4.webclient.PMainActivity"

.field private static final TAG:Ljava/lang/String;

.field private static final TIME_TO_WAIT:I = 0x3e8

.field private static mContext:Landroid/content/Context;

.field public static mDID:Lcom/disney/id/android/DIDSession;


# instance fields
.field private final mHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const-class v0, Lcom/disney/id/android/webclient/PMainActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/webclient/PMainActivity;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 31
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 35
    new-instance v0, Lcom/disney/id/android/webclient/PMainActivity$CustomHandler;

    invoke-direct {v0, p0}, Lcom/disney/id/android/webclient/PMainActivity$CustomHandler;-><init>(Lcom/disney/id/android/webclient/PMainActivity;)V

    iput-object v0, p0, Lcom/disney/id/android/webclient/PMainActivity;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/disney/id/android/webclient/PMainActivity;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/disney/id/android/webclient/PMainActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/webclient/PMainActivity;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/disney/id/android/webclient/PMainActivity;->setUIControls()V

    return-void
.end method

.method static synthetic access$200(Lcom/disney/id/android/webclient/PMainActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/webclient/PMainActivity;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/disney/id/android/webclient/PMainActivity;->stopProgressScreen()V

    return-void
.end method

.method private setUIControls()V
    .locals 1

    .prologue
    .line 356
    sget-object v0, Lcom/disney/id/android/webclient/PMainActivity;->mDID:Lcom/disney/id/android/DIDSession;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSession;->isLoggedIn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 365
    :cond_0
    return-void
.end method

.method private stopProgressScreen()V
    .locals 0

    .prologue
    .line 382
    return-void
.end method


# virtual methods
.method protected getLowTrustText()Ljava/lang/String;
    .locals 16

    .prologue
    .line 338
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v9

    invoke-virtual {v9}, Lcom/disney/id/android/DIDGuest;->secondsUntilLowTrust()J

    move-result-wide v6

    .line 339
    .local v6, "seconds":J
    const-string v8, ""

    .line 340
    .local v8, "text":Ljava/lang/String;
    const-wide/16 v10, 0x0

    cmp-long v9, v6, v10

    if-lez v9, :cond_0

    .line 341
    sget-object v9, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v9, v6, v7}, Ljava/util/concurrent/TimeUnit;->toHours(J)J

    move-result-wide v0

    .line 342
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

    .line 343
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

    .line 344
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

    .line 346
    .end local v0    # "hours":J
    .end local v2    # "minute":J
    .end local v4    # "second":J
    :cond_0
    return-object v8
.end method

.method protected getTokenExpiresText()Ljava/lang/String;
    .locals 16

    .prologue
    .line 326
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v9

    invoke-virtual {v9}, Lcom/disney/id/android/DIDGuest;->secondsUntilTokenExpiration()J

    move-result-wide v6

    .line 327
    .local v6, "seconds":J
    const-string v8, ""

    .line 328
    .local v8, "text":Ljava/lang/String;
    const-wide/16 v10, 0x0

    cmp-long v9, v6, v10

    if-lez v9, :cond_0

    .line 329
    sget-object v9, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v9, v6, v7}, Ljava/util/concurrent/TimeUnit;->toHours(J)J

    move-result-wide v0

    .line 330
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

    .line 331
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

    .line 332
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

    .line 334
    .end local v0    # "hours":J
    .end local v2    # "minute":J
    .end local v4    # "second":J
    :cond_0
    return-object v8
.end method

.method public logout()V
    .locals 1

    .prologue
    .line 209
    sget-object v0, Lcom/disney/id/android/webclient/PMainActivity;->mDID:Lcom/disney/id/android/DIDSession;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSession;->logout()V

    .line 210
    return-void
.end method

.method public onClose()V
    .locals 1

    .prologue
    .line 316
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/disney/id/android/webclient/PMainActivity;->setResult(I)V

    .line 317
    invoke-virtual {p0}, Lcom/disney/id/android/webclient/PMainActivity;->finish()V

    .line 318
    return-void
.end method

.method public onCreate()V
    .locals 5

    .prologue
    .line 187
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 188
    .local v1, "j":Lorg/json/JSONObject;
    const-string v3, "guestData"

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 189
    const-string v3, "tokenData"

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/DIDGuest;->getTokenJSON()Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 191
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/disney/id/android/webclient/DisIDPlugin;->resultRegistrationSuccess(Lorg/json/JSONObject;)V

    .line 194
    new-instance v2, Landroid/os/Message;

    invoke-direct {v2}, Landroid/os/Message;-><init>()V

    .line 195
    .local v2, "msg":Landroid/os/Message;
    const/16 v3, 0x10

    iput v3, v2, Landroid/os/Message;->what:I

    .line 196
    iget-object v3, p0, Lcom/disney/id/android/webclient/PMainActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 206
    .end local v1    # "j":Lorg/json/JSONObject;
    .end local v2    # "msg":Landroid/os/Message;
    :goto_0
    return-void

    .line 202
    :catch_0
    move-exception v0

    .line 203
    .local v0, "e":Lorg/json/JSONException;
    sget-object v3, Lcom/disney/id/android/webclient/PMainActivity;->TAG:Ljava/lang/String;

    const-string v4, "Error with Json Data"

    invoke-static {v3, v4}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 114
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 118
    sput-object p0, Lcom/disney/id/android/webclient/PMainActivity;->mContext:Landroid/content/Context;

    .line 121
    new-instance v0, Lcom/disney/id/android/DIDSession;

    sget-object v1, Lcom/disney/id/android/webclient/PMainActivity;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p0}, Lcom/disney/id/android/DIDSession;-><init>(Landroid/content/Context;Lcom/disney/id/android/DIDSessionDelegate;)V

    sput-object v0, Lcom/disney/id/android/webclient/PMainActivity;->mDID:Lcom/disney/id/android/DIDSession;

    .line 122
    sget-object v0, Lcom/disney/id/android/webclient/PMainActivity;->mDID:Lcom/disney/id/android/DIDSession;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSession;->start()V

    .line 124
    sget-object v0, Lcom/disney/id/android/webclient/PMainActivity;->mDID:Lcom/disney/id/android/DIDSession;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSession;->launchLogin()V

    .line 126
    return-void
.end method

.method onDIDResponse(Ljava/lang/String;)V
    .locals 2
    .param p1, "toast"    # Ljava/lang/String;

    .prologue
    .line 350
    if-eqz p1, :cond_0

    .line 351
    sget-object v0, Lcom/disney/id/android/webclient/PMainActivity;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 352
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 354
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 136
    sget-object v0, Lcom/disney/id/android/webclient/PMainActivity;->TAG:Ljava/lang/String;

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    sget-object v0, Lcom/disney/id/android/webclient/PMainActivity;->mDID:Lcom/disney/id/android/DIDSession;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSession;->stop()V

    .line 138
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 139
    return-void
.end method

.method public onError(Lcom/disney/id/android/DIDException;)V
    .locals 0
    .param p1, "exception"    # Lcom/disney/id/android/DIDException;

    .prologue
    .line 323
    return-void
.end method

.method public onForceTokenRefreshFailure(Lcom/disney/id/android/DIDException;)V
    .locals 4
    .param p1, "exception"    # Lcom/disney/id/android/DIDException;

    .prologue
    .line 284
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 285
    .local v1, "j":Lorg/json/JSONObject;
    const-string v2, "error"

    invoke-virtual {p1}, Lcom/disney/id/android/DIDException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 286
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/disney/id/android/webclient/DisIDPlugin;->resultSilentLoginError(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 291
    .end local v1    # "j":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 288
    :catch_0
    move-exception v0

    .line 289
    .local v0, "e":Lorg/json/JSONException;
    sget-object v2, Lcom/disney/id/android/webclient/PMainActivity;->TAG:Ljava/lang/String;

    const-string v3, "Error with Json Data"

    invoke-static {v2, v3}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onForceTokenRefreshSuccess()V
    .locals 4

    .prologue
    .line 268
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 269
    .local v1, "j":Lorg/json/JSONObject;
    const-string v2, "guestData"

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 270
    const-string v2, "tokenData"

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDGuest;->getTokenJSON()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 272
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/disney/id/android/webclient/DisIDPlugin;->resultSilentLoginSuccess(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 277
    .end local v1    # "j":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 274
    :catch_0
    move-exception v0

    .line 275
    .local v0, "e":Lorg/json/JSONException;
    sget-object v2, Lcom/disney/id/android/webclient/PMainActivity;->TAG:Ljava/lang/String;

    const-string v3, "Error with Json Data"

    invoke-static {v2, v3}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onLogin()V
    .locals 5

    .prologue
    .line 166
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 167
    .local v1, "j":Lorg/json/JSONObject;
    const-string v3, "guestData"

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 168
    const-string v3, "tokenData"

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/DIDGuest;->getTokenJSON()Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 170
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/disney/id/android/webclient/DisIDPlugin;->resultLoggedIn(Lorg/json/JSONObject;)V

    .line 172
    new-instance v2, Landroid/os/Message;

    invoke-direct {v2}, Landroid/os/Message;-><init>()V

    .line 173
    .local v2, "msg":Landroid/os/Message;
    const/4 v3, 0x6

    iput v3, v2, Landroid/os/Message;->what:I

    .line 174
    iget-object v3, p0, Lcom/disney/id/android/webclient/PMainActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 180
    .end local v1    # "j":Lorg/json/JSONObject;
    .end local v2    # "msg":Landroid/os/Message;
    :goto_0
    return-void

    .line 176
    :catch_0
    move-exception v0

    .line 177
    .local v0, "e":Lorg/json/JSONException;
    sget-object v3, Lcom/disney/id/android/webclient/PMainActivity;->TAG:Ljava/lang/String;

    const-string v4, "Error with Json Data"

    invoke-static {v3, v4}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onLoginBlueFailure(Lcom/disney/id/android/DIDException;)V
    .locals 0
    .param p1, "exception"    # Lcom/disney/id/android/DIDException;

    .prologue
    .line 311
    return-void
.end method

.method public onLoginBlueSuccess()V
    .locals 0

    .prologue
    .line 306
    return-void
.end method

.method public onLogout()V
    .locals 1

    .prologue
    .line 214
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/webclient/DisIDPlugin;->resultLoggedOut()V

    .line 215
    return-void
.end method

.method public onLowTrust()V
    .locals 0

    .prologue
    .line 220
    return-void
.end method

.method public onOptIn(Ljava/lang/String;)V
    .locals 0
    .param p1, "optinList"    # Ljava/lang/String;

    .prologue
    .line 225
    return-void
.end method

.method public onReauth()V
    .locals 0

    .prologue
    .line 230
    invoke-virtual {p0}, Lcom/disney/id/android/webclient/PMainActivity;->onForceTokenRefreshSuccess()V

    .line 231
    return-void
.end method

.method public onRefresh()V
    .locals 0

    .prologue
    .line 236
    return-void
.end method

.method public onRefreshGuestDataFailure(Lcom/disney/id/android/DIDException;)V
    .locals 0
    .param p1, "exception"    # Lcom/disney/id/android/DIDException;

    .prologue
    .line 301
    return-void
.end method

.method public onRefreshGuestDataSuccess()V
    .locals 0

    .prologue
    .line 296
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 129
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 130
    sget-object v0, Lcom/disney/id/android/webclient/PMainActivity;->mDID:Lcom/disney/id/android/DIDSession;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSession;->start()V

    .line 131
    return-void
.end method

.method public onSetup()V
    .locals 2

    .prologue
    .line 145
    sput-object p0, Lcom/disney/id/android/webclient/PMainActivity;->mContext:Landroid/content/Context;

    .line 147
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->ENV_KEY:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionConfig;->setEnv(Ljava/lang/String;)V

    .line 148
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->CLIENT_ID_KEY:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionConfig;->setClientId(Ljava/lang/String;)V

    .line 149
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->LANGUAGE_PREFERENCE_KEY:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionConfig;->setLanguagePreference(Ljava/lang/String;)V

    .line 150
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->COUNTRY_PREFERENCE_KEY:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionConfig;->setCountryPreference(Ljava/lang/String;)V

    .line 151
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    sget-boolean v0, Lcom/disney/id/android/webclient/DisIDPlugin;->DEBUG_KEY:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionConfig;->setDebug(Ljava/lang/Boolean;)V

    .line 153
    sget-object v0, Lcom/disney/id/android/webclient/PMainActivity;->mDID:Lcom/disney/id/android/DIDSession;

    if-nez v0, :cond_0

    .line 154
    new-instance v0, Lcom/disney/id/android/DIDSession;

    sget-object v1, Lcom/disney/id/android/webclient/PMainActivity;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p0}, Lcom/disney/id/android/DIDSession;-><init>(Landroid/content/Context;Lcom/disney/id/android/DIDSessionDelegate;)V

    sput-object v0, Lcom/disney/id/android/webclient/PMainActivity;->mDID:Lcom/disney/id/android/DIDSession;

    .line 155
    sget-object v0, Lcom/disney/id/android/webclient/PMainActivity;->mDID:Lcom/disney/id/android/DIDSession;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSession;->start()V

    .line 158
    :cond_0
    sget-object v0, Lcom/disney/id/android/webclient/PMainActivity;->mDID:Lcom/disney/id/android/DIDSession;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSession;->launchLogin()V

    .line 159
    return-void
.end method

.method public onUpdate(Ljava/lang/String;)V
    .locals 5
    .param p1, "delta"    # Ljava/lang/String;

    .prologue
    .line 243
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 244
    .local v1, "j":Lorg/json/JSONObject;
    const-string v3, "guestData"

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 245
    const-string v3, "tokenData"

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/DIDGuest;->getTokenJSON()Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 247
    invoke-static {}, Lcom/disney/id/android/webclient/DisIDPlugin;->instance()Lcom/disney/id/android/webclient/DisIDPlugin;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/disney/id/android/webclient/DisIDPlugin;->resultProfileUpdateSuccess(Lorg/json/JSONObject;)V

    .line 249
    new-instance v2, Landroid/os/Message;

    invoke-direct {v2}, Landroid/os/Message;-><init>()V

    .line 250
    .local v2, "msg":Landroid/os/Message;
    const/16 v3, 0x9

    iput v3, v2, Landroid/os/Message;->what:I

    .line 251
    iget-object v3, p0, Lcom/disney/id/android/webclient/PMainActivity;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 257
    .end local v1    # "j":Lorg/json/JSONObject;
    .end local v2    # "msg":Landroid/os/Message;
    :goto_0
    return-void

    .line 254
    :catch_0
    move-exception v0

    .line 255
    .local v0, "e":Lorg/json/JSONException;
    sget-object v3, Lcom/disney/id/android/webclient/PMainActivity;->TAG:Ljava/lang/String;

    const-string v4, "Error with Json Data"

    invoke-static {v3, v4}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
