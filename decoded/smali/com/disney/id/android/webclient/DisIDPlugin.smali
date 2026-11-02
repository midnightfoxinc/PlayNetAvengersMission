.class public Lcom/disney/id/android/webclient/DisIDPlugin;
.super Ljava/lang/Object;
.source "DisIDPlugin.java"


# static fields
.field public static CLIENT_ID_KEY:Ljava/lang/String;

.field public static COUNTRY_PREFERENCE_KEY:Ljava/lang/String;

.field public static CSS_OVERRIDE_URL_KEY:Ljava/lang/String;

.field public static DEBUG_KEY:Z

.field public static ENV_KEY:Ljava/lang/String;

.field public static HIDE_STATUS_BAR_KEY:Ljava/lang/String;

.field static INSTANCE:Lcom/disney/id/android/webclient/DisIDPlugin;

.field public static LANGUAGE_PREFERENCE_KEY:Ljava/lang/String;

.field public static SHARED_PREFERENCES_FILE_NAME:Ljava/lang/String;

.field private static final TAG:Ljava/lang/String;


# instance fields
.field protected mContext:Landroid/content/Context;

.field protected mDID:Lcom/disney/id/android/DIDSession;

.field private mDisidCallbackObj:Ljava/lang/String;

.field private mainRequestType:I

.field private storedSessionConfig:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const/4 v0, 0x0

    sput-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->INSTANCE:Lcom/disney/id/android/webclient/DisIDPlugin;

    .line 18
    const-class v0, Lcom/disney/id/android/webclient/DisIDPlugin;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->TAG:Ljava/lang/String;

    .line 31
    const-string v0, "com.disney.id.v3.ENV_KEY"

    sput-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->ENV_KEY:Ljava/lang/String;

    .line 32
    const-string v0, "com.disney.id.v3.CLIENT_ID_KEY"

    sput-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->CLIENT_ID_KEY:Ljava/lang/String;

    .line 33
    const-string v0, "com.disney.id.v3.LANGUAGE_PREFERENCE_KEY"

    sput-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->LANGUAGE_PREFERENCE_KEY:Ljava/lang/String;

    .line 34
    const-string v0, "com.disney.id.v3.CSS_OVERRIDE_URL_KEY"

    sput-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->CSS_OVERRIDE_URL_KEY:Ljava/lang/String;

    .line 35
    const-string v0, "com.disney.id.v3.COUNTRY_PREFERENCE_KEY"

    sput-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->COUNTRY_PREFERENCE_KEY:Ljava/lang/String;

    .line 36
    const/4 v0, 0x0

    sput-boolean v0, Lcom/disney/id/android/webclient/DisIDPlugin;->DEBUG_KEY:Z

    .line 37
    const-string v0, "com.disney.id.v3.HIDE_STATUS_BAR_KEY"

    sput-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->HIDE_STATUS_BAR_KEY:Ljava/lang/String;

    .line 38
    const-string v0, "stored_session_config"

    sput-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->SHARED_PREFERENCES_FILE_NAME:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/id/android/webclient/DisIDPlugin;->mDisidCallbackObj:Ljava/lang/String;

    .line 28
    const/4 v0, 0x0

    iput v0, p0, Lcom/disney/id/android/webclient/DisIDPlugin;->mainRequestType:I

    .line 42
    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->INSTANCE:Lcom/disney/id/android/webclient/DisIDPlugin;

    if-nez v0, :cond_0

    .line 44
    sput-object p0, Lcom/disney/id/android/webclient/DisIDPlugin;->INSTANCE:Lcom/disney/id/android/webclient/DisIDPlugin;

    .line 46
    :cond_0
    return-void
.end method

.method static synthetic access$002(Lcom/disney/id/android/webclient/DisIDPlugin;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/webclient/DisIDPlugin;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 15
    iput-object p1, p0, Lcom/disney/id/android/webclient/DisIDPlugin;->mDisidCallbackObj:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 15
    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public static instance()Lcom/disney/id/android/webclient/DisIDPlugin;
    .locals 1

    .prologue
    .line 50
    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->INSTANCE:Lcom/disney/id/android/webclient/DisIDPlugin;

    if-nez v0, :cond_0

    .line 52
    new-instance v0, Lcom/disney/id/android/webclient/DisIDPlugin;

    invoke-direct {v0}, Lcom/disney/id/android/webclient/DisIDPlugin;-><init>()V

    sput-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->INSTANCE:Lcom/disney/id/android/webclient/DisIDPlugin;

    .line 54
    :cond_0
    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->INSTANCE:Lcom/disney/id/android/webclient/DisIDPlugin;

    return-object v0
.end method

.method private unitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "callbackObject"    # Ljava/lang/String;
    .param p2, "method"    # Ljava/lang/String;
    .param p3, "jsonData"    # Ljava/lang/String;

    .prologue
    .line 141
    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "callbackObject !!!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    invoke-static {p1, p2, p3}, Lcom/unity3d/player/UnityPlayer;->UnitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    return-void
.end method


# virtual methods
.method public launchDisIdLoginPage()V
    .locals 2

    .prologue
    .line 115
    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->TAG:Ljava/lang/String;

    const-string v1, "launchDisIdLoginPage-----"

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/disney/id/android/webclient/DisIDPlugin$2;

    invoke-direct {v1, p0}, Lcom/disney/id/android/webclient/DisIDPlugin$2;-><init>(Lcom/disney/id/android/webclient/DisIDPlugin;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 121
    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->TAG:Ljava/lang/String;

    const-string v1, "launchDisIdLoginPage +++++++  -----"

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    return-void
.end method

.method public onDisidLogout()V
    .locals 2

    .prologue
    .line 177
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/disney/id/android/webclient/DisIDPlugin$3;

    invoke-direct {v1, p0}, Lcom/disney/id/android/webclient/DisIDPlugin$3;-><init>(Lcom/disney/id/android/webclient/DisIDPlugin;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 192
    return-void
.end method

.method public onSilentLogin()V
    .locals 0

    .prologue
    .line 148
    return-void
.end method

.method public resultLoggedIn(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 125
    const-string v0, "onLoginSuccess"

    invoke-virtual {p0, v0, p1}, Lcom/disney/id/android/webclient/DisIDPlugin;->updateUnityMethods(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 126
    return-void
.end method

.method public resultLoggedOut()V
    .locals 1

    .prologue
    .line 129
    const-string v0, "{\"logout\":\"Success\"}"

    .line 130
    .local v0, "returnString":Ljava/lang/String;
    return-void
.end method

.method public resultNetworkError()V
    .locals 3

    .prologue
    .line 134
    const-string v0, "{\"error\":\"Error\"}"

    .line 135
    .local v0, "returnString":Ljava/lang/String;
    iget-object v1, p0, Lcom/disney/id/android/webclient/DisIDPlugin;->mDisidCallbackObj:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 136
    iget-object v1, p0, Lcom/disney/id/android/webclient/DisIDPlugin;->mDisidCallbackObj:Ljava/lang/String;

    const-string v2, "onWebConnectivityErrorWithError"

    invoke-direct {p0, v1, v2, v0}, Lcom/disney/id/android/webclient/DisIDPlugin;->unitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    :cond_0
    return-void
.end method

.method public resultProfileUpdateSuccess(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 160
    const-string v0, "resultProfileUpdateSuccess"

    invoke-virtual {p0, v0, p1}, Lcom/disney/id/android/webclient/DisIDPlugin;->updateUnityMethods(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 161
    return-void
.end method

.method public resultRegistrationSuccess(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 157
    const-string v0, "onRegistrationSuccess"

    invoke-virtual {p0, v0, p1}, Lcom/disney/id/android/webclient/DisIDPlugin;->updateUnityMethods(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 158
    return-void
.end method

.method public resultSilentLoginError(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 153
    const-string v0, "resultSilentLoginError"

    invoke-virtual {p0, v0, p1}, Lcom/disney/id/android/webclient/DisIDPlugin;->updateUnityMethods(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 154
    return-void
.end method

.method public resultSilentLoginSuccess(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 150
    const-string v0, "onSilentLoginSuccess"

    invoke-virtual {p0, v0, p1}, Lcom/disney/id/android/webclient/DisIDPlugin;->updateUnityMethods(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 151
    return-void
.end method

.method public setDisneyIDContext(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/disney/id/android/webclient/DisIDPlugin;->mContext:Landroid/content/Context;

    .line 65
    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setDisneyIDContext: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Application Context: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    return-void
.end method

.method public setupDisneyId(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "clientID"    # Ljava/lang/String;
    .param p3, "country"    # Ljava/lang/String;
    .param p4, "languageSelection"    # Ljava/lang/String;
    .param p5, "environment"    # Ljava/lang/String;
    .param p6, "coreEnvironment"    # Ljava/lang/String;
    .param p7, "javascriptDebugState"    # Z

    .prologue
    .line 81
    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Main thread: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "This thread: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    new-instance v8, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {v8, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v0, Lcom/disney/id/android/webclient/DisIDPlugin$1;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p5

    move-object v4, p2

    move/from16 v5, p7

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/disney/id/android/webclient/DisIDPlugin$1;-><init>(Lcom/disney/id/android/webclient/DisIDPlugin;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 111
    return-void
.end method

.method public test()V
    .locals 2

    .prologue
    .line 59
    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->TAG:Ljava/lang/String;

    const-string v1, "Test Called"

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    return-void
.end method

.method public updateUnityMethods(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "callbackMethod"    # Ljava/lang/String;
    .param p2, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 164
    if-nez p2, :cond_1

    .line 165
    invoke-virtual {p0}, Lcom/disney/id/android/webclient/DisIDPlugin;->resultNetworkError()V

    .line 174
    :cond_0
    :goto_0
    return-void

    .line 169
    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/disney/id/android/webclient/DisIDPlugin;->mDisidCallbackObj:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 170
    sget-object v0, Lcom/disney/id/android/webclient/DisIDPlugin;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/disney/id/android/webclient/LogChopper;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    iget-object v0, p0, Lcom/disney/id/android/webclient/DisIDPlugin;->mDisidCallbackObj:Ljava/lang/String;

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, p1, v1}, Lcom/disney/id/android/webclient/DisIDPlugin;->unitySendMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 173
    :catch_0
    move-exception v0

    goto :goto_0
.end method
