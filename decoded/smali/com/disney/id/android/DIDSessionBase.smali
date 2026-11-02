.class public Lcom/disney/id/android/DIDSessionBase;
.super Ljava/lang/Object;
.source "DIDSessionBase.java"


# static fields
.field static final REQUEST_EXTRA:Ljava/lang/String; = "com.disney.id.android.REQUEST"

.field static final RESULT_EXTRA:Ljava/lang/String; = "com.disney.id.android.RESULT"

.field static final RESULT_INTENT_ACTION:Ljava/lang/String; = "com.disney.id.android.ACTION"

.field private static final TAG:Ljava/lang/String;

.field private static final ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;


# instance fields
.field protected final mCallback:Lcom/disney/id/android/DIDSessionDelegate;

.field protected final mContext:Landroid/content/Context;

.field protected final mDIDLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

.field private mDIDService:Lcom/disney/id/android/DIDService;

.field protected mDefaultOptionalConfigs:Lcom/disney/id/android/DIDOptionalConfigs;

.field protected mIsBinding:Z

.field protected mIsBound:Z

.field private mRequestQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/disney/id/android/DIDRequest;",
            ">;"
        }
    .end annotation
.end field

.field protected final mServiceConnection:Lcom/disney/id/android/DIDSession$DIDSilentServiceConnection;

.field protected final myConnection:Landroid/content/ServiceConnection;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    invoke-static {}, Lcom/disney/id/android/DIDSessionBase;->ajc$preClinit()V

    .line 35
    const-class v0, Lcom/disney/id/android/DIDSession;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDSessionBase;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/disney/id/android/DIDSessionDelegate;Lcom/disney/id/android/DIDSession$DIDSilentServiceConnection;Landroid/content/Context;)V
    .locals 2
    .param p1, "callback"    # Lcom/disney/id/android/DIDSessionDelegate;
    .param p2, "serviceConnection"    # Lcom/disney/id/android/DIDSession$DIDSilentServiceConnection;
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Lcom/disney/id/android/DIDSessionBase$1;

    invoke-direct {v0, p0}, Lcom/disney/id/android/DIDSessionBase$1;-><init>(Lcom/disney/id/android/DIDSessionBase;)V

    iput-object v0, p0, Lcom/disney/id/android/DIDSessionBase;->myConnection:Landroid/content/ServiceConnection;

    .line 78
    iput-boolean v1, p0, Lcom/disney/id/android/DIDSessionBase;->mIsBound:Z

    .line 79
    iput-boolean v1, p0, Lcom/disney/id/android/DIDSessionBase;->mIsBinding:Z

    .line 82
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/DIDSessionBase;->mRequestQueue:Ljava/util/Queue;

    .line 85
    iput-object p1, p0, Lcom/disney/id/android/DIDSessionBase;->mCallback:Lcom/disney/id/android/DIDSessionDelegate;

    .line 86
    iput-object p3, p0, Lcom/disney/id/android/DIDSessionBase;->mContext:Landroid/content/Context;

    .line 87
    new-instance v0, Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    iget-object v1, p0, Lcom/disney/id/android/DIDSessionBase;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/disney/id/android/DIDSessionBase;->mDIDLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    .line 88
    iput-object p2, p0, Lcom/disney/id/android/DIDSessionBase;->mServiceConnection:Lcom/disney/id/android/DIDSession$DIDSilentServiceConnection;

    .line 89
    return-void
.end method

.method static synthetic access$002(Lcom/disney/id/android/DIDSessionBase;Lcom/disney/id/android/DIDService;)Lcom/disney/id/android/DIDService;
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/DIDSessionBase;
    .param p1, "x1"    # Lcom/disney/id/android/DIDService;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/disney/id/android/DIDSessionBase;->mDIDService:Lcom/disney/id/android/DIDService;

    return-object p1
.end method

.method static synthetic access$100(Lcom/disney/id/android/DIDSessionBase;)Ljava/util/Queue;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/DIDSessionBase;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionBase;->mRequestQueue:Ljava/util/Queue;

    return-object v0
.end method

.method private static ajc$preClinit()V
    .locals 9

    .prologue
    .line 1
    new-instance v0, Lorg/aspectj/runtime/reflect/Factory;

    const-string v1, "DIDSessionBase.java"

    const-class v2, Lcom/disney/id/android/DIDSessionBase;

    invoke-direct {v0, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    const-string v8, "method-execution"

    const-string v1, "4"

    const-string v2, "isAuthenticatedViaSocial"

    const-string v3, "com.disney.id.android.DIDSessionBase"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "boolean"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x5d

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDSessionBase;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "4"

    const-string v2, "getJSON"

    const-string v3, "com.disney.id.android.DIDSessionBase"

    const-string v4, "com.disney.id.android.DIDOptionalConfigs"

    const-string v5, "transactionalConfigs"

    const-string v6, ""

    const-string v7, "org.json.JSONObject"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x77

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDSessionBase;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "4"

    const-string v2, "startRequest"

    const-string v3, "com.disney.id.android.DIDSessionBase"

    const-string v4, "com.disney.id.android.DIDRequest:boolean"

    const-string v5, "request:silent"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xb5

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDSessionBase;->ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

    return-void
.end method

.method private determineActivityToLaunch(Lcom/disney/id/android/DIDRequest;)Ljava/lang/Class;
    .locals 1
    .param p1, "request"    # Lcom/disney/id/android/DIDRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disney/id/android/DIDRequest;",
            ")",
            "Ljava/lang/Class",
            "<+",
            "Landroid/support/v4/app/FragmentActivity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 204
    invoke-virtual {p1}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v0

    invoke-static {v0}, Lcom/disney/id/android/external/DIDExternalFactory;->isExternal(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 205
    const-class v0, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    .line 208
    :goto_0
    return-object v0

    :cond_0
    const-class v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    goto :goto_0
.end method

.method private static final getJSON_aroundBody2(Lcom/disney/id/android/DIDSessionBase;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;)Lorg/json/JSONObject;
    .locals 3
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSessionBase;
    .param p1, "transactionalConfigs"    # Lcom/disney/id/android/DIDOptionalConfigs;

    .prologue
    .line 119
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 121
    .local v1, "optionalConfigsJSON":Lorg/json/JSONObject;
    iget-object v2, p0, Lcom/disney/id/android/DIDSessionBase;->mDefaultOptionalConfigs:Lcom/disney/id/android/DIDOptionalConfigs;

    invoke-direct {p0, v1, v2}, Lcom/disney/id/android/DIDSessionBase;->mergeOptionalConfigsIntoJSON(Lorg/json/JSONObject;Lcom/disney/id/android/DIDOptionalConfigs;)V

    .line 122
    invoke-direct {p0, v1, p1}, Lcom/disney/id/android/DIDSessionBase;->mergeOptionalConfigsIntoJSON(Lorg/json/JSONObject;Lcom/disney/id/android/DIDOptionalConfigs;)V

    .line 124
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 126
    .local v0, "json":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "optionalConfigs"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    :goto_0
    return-object v0

    .line 127
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private static final getJSON_aroundBody3$advice(Lcom/disney/id/android/DIDSessionBase;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSessionBase;
    .param p1, "transactionalConfigs"    # Lcom/disney/id/android/DIDOptionalConfigs;
    .param p2, "thisJoinPoint"    # Lorg/aspectj/lang/JoinPoint;
    .param p3, "ajc$aspectInstance"    # Lcom/disney/id/android/gintonic/aspect/TraceAspect;
    .param p4, "joinPoint"    # Lorg/aspectj/lang/ProceedingJoinPoint;

    .prologue
    .line 36
    invoke-interface {p4}, Lorg/aspectj/lang/ProceedingJoinPoint;->getSignature()Lorg/aspectj/lang/Signature;

    move-result-object v2

    check-cast v2, Lorg/aspectj/lang/reflect/MethodSignature;

    .line 37
    .local v2, "methodSignature":Lorg/aspectj/lang/reflect/MethodSignature;
    invoke-interface {v2}, Lorg/aspectj/lang/reflect/MethodSignature;->getDeclaringType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 38
    .local v0, "className":Ljava/lang/String;
    invoke-interface {v2}, Lorg/aspectj/lang/reflect/MethodSignature;->getName()Ljava/lang/String;

    move-result-object v1

    .line 40
    .local v1, "methodName":Ljava/lang/String;
    new-instance v4, Lcom/disney/id/android/gintonic/internal/StopWatch;

    invoke-direct {v4}, Lcom/disney/id/android/gintonic/internal/StopWatch;-><init>()V

    .line 41
    .local v4, "stopWatch":Lcom/disney/id/android/gintonic/internal/StopWatch;
    invoke-virtual {v4}, Lcom/disney/id/android/gintonic/internal/StopWatch;->start()V

    .line 42
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/DIDSessionBase;->getJSON_aroundBody2(Lcom/disney/id/android/DIDSessionBase;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;)Lorg/json/JSONObject;

    move-result-object v3

    .line 43
    .local v3, "result":Lorg/json/JSONObject;
    invoke-virtual {v4}, Lcom/disney/id/android/gintonic/internal/StopWatch;->stop()V

    .line 45
    invoke-virtual {v4}, Lcom/disney/id/android/gintonic/internal/StopWatch;->getTotalTimeMillis()J

    move-result-wide v6

    invoke-static {v1, v6, v7}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->ajc$inlineAccessMethod$com_disney_id_android_gintonic_aspect_TraceAspect$com_disney_id_android_gintonic_aspect_TraceAspect$buildLogMessage(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    return-object v3
.end method

.method private static final isAuthenticatedViaSocial_aroundBody0(Lcom/disney/id/android/DIDSessionBase;Lorg/aspectj/lang/JoinPoint;)Z
    .locals 7
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSessionBase;

    .prologue
    .line 93
    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "mobile_social"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "facebook_token"

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "google_token"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string v6, "amazon_token"

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-string v6, "gamenetwork"

    aput-object v6, v4, v5

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 95
    .local v2, "ignoredAuthenticators":Ljava/util/List;
    invoke-static {}, Lcom/disney/id/android/DIDAuthenticatorUtils;->createAuthenticatorRetrievalKey()Lcom/disney/id/android/localdata/DIDLocalData;

    move-result-object v1

    .line 96
    .local v1, "authenticatorData":Lcom/disney/id/android/localdata/DIDLocalData;
    iget-object v4, p0, Lcom/disney/id/android/DIDSessionBase;->mDIDLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    invoke-virtual {v4, v1}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->getData(Lcom/disney/id/android/localdata/DIDLocalData;)Lcom/disney/id/android/localdata/DIDLocalData;

    move-result-object v3

    .line 98
    .local v3, "modifiedAuthenticatorData":Lcom/disney/id/android/localdata/DIDLocalData;
    invoke-direct {p0, v3}, Lcom/disney/id/android/DIDSessionBase;->parseAuthenticator(Lcom/disney/id/android/localdata/DIDLocalData;)Ljava/lang/String;

    move-result-object v0

    .line 100
    .local v0, "authenticator":Ljava/lang/String;
    invoke-interface {v2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    return v4
.end method

.method private static final isAuthenticatedViaSocial_aroundBody1$advice(Lcom/disney/id/android/DIDSessionBase;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSessionBase;
    .param p1, "thisJoinPoint"    # Lorg/aspectj/lang/JoinPoint;
    .param p2, "ajc$aspectInstance"    # Lcom/disney/id/android/gintonic/aspect/TraceAspect;
    .param p3, "joinPoint"    # Lorg/aspectj/lang/ProceedingJoinPoint;

    .prologue
    .line 36
    invoke-interface {p3}, Lorg/aspectj/lang/ProceedingJoinPoint;->getSignature()Lorg/aspectj/lang/Signature;

    move-result-object v2

    check-cast v2, Lorg/aspectj/lang/reflect/MethodSignature;

    .line 37
    .local v2, "methodSignature":Lorg/aspectj/lang/reflect/MethodSignature;
    invoke-interface {v2}, Lorg/aspectj/lang/reflect/MethodSignature;->getDeclaringType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 38
    .local v0, "className":Ljava/lang/String;
    invoke-interface {v2}, Lorg/aspectj/lang/reflect/MethodSignature;->getName()Ljava/lang/String;

    move-result-object v1

    .line 40
    .local v1, "methodName":Ljava/lang/String;
    new-instance v4, Lcom/disney/id/android/gintonic/internal/StopWatch;

    invoke-direct {v4}, Lcom/disney/id/android/gintonic/internal/StopWatch;-><init>()V

    .line 41
    .local v4, "stopWatch":Lcom/disney/id/android/gintonic/internal/StopWatch;
    invoke-virtual {v4}, Lcom/disney/id/android/gintonic/internal/StopWatch;->start()V

    .line 42
    invoke-static {p0, p3}, Lcom/disney/id/android/DIDSessionBase;->isAuthenticatedViaSocial_aroundBody0(Lcom/disney/id/android/DIDSessionBase;Lorg/aspectj/lang/JoinPoint;)Z

    move-result v5

    invoke-static {v5}, Lorg/aspectj/runtime/internal/Conversions;->booleanObject(Z)Ljava/lang/Object;

    move-result-object v3

    .line 43
    .local v3, "result":Ljava/lang/Object;
    invoke-virtual {v4}, Lcom/disney/id/android/gintonic/internal/StopWatch;->stop()V

    .line 45
    invoke-virtual {v4}, Lcom/disney/id/android/gintonic/internal/StopWatch;->getTotalTimeMillis()J

    move-result-wide v6

    invoke-static {v1, v6, v7}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->ajc$inlineAccessMethod$com_disney_id_android_gintonic_aspect_TraceAspect$com_disney_id_android_gintonic_aspect_TraceAspect$buildLogMessage(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    return-object v3
.end method

.method private mergeOptionalConfigsIntoJSON(Lorg/json/JSONObject;Lcom/disney/id/android/DIDOptionalConfigs;)V
    .locals 6
    .param p1, "json"    # Lorg/json/JSONObject;
    .param p2, "optionalConfigs"    # Lcom/disney/id/android/DIDOptionalConfigs;

    .prologue
    .line 135
    if-eqz p2, :cond_0

    .line 136
    invoke-virtual {p2}, Lcom/disney/id/android/DIDOptionalConfigs;->toJSON()Lorg/json/JSONObject;

    move-result-object v0

    .line 137
    .local v0, "defaultJSON":Lorg/json/JSONObject;
    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 138
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 140
    .local v2, "key":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 141
    :catch_0
    move-exception v1

    .line 142
    .local v1, "e":Lorg/json/JSONException;
    sget-object v4, Lcom/disney/id/android/DIDSessionBase;->TAG:Ljava/lang/String;

    invoke-static {v4}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "Exception occurred trying to add profileContext fields to json."

    invoke-static {v4, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 146
    .end local v0    # "defaultJSON":Lorg/json/JSONObject;
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    return-void
.end method

.method private parseAuthenticator(Lcom/disney/id/android/localdata/DIDLocalData;)Ljava/lang/String;
    .locals 4
    .param p1, "authenticatorData"    # Lcom/disney/id/android/localdata/DIDLocalData;

    .prologue
    .line 104
    invoke-static {}, Lcom/disney/id/android/DIDAuthenticatorUtils;->retrieveAuthenticatorKey()Ljava/lang/String;

    move-result-object v1

    .line 105
    .local v1, "authenticatorKey":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/disney/id/android/localdata/DIDLocalData;->getData()Lorg/json/JSONObject;

    move-result-object v2

    .line 107
    .local v2, "rawAuthenticatorData":Lorg/json/JSONObject;
    const/4 v0, 0x0

    .line 110
    .local v0, "authenticator":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 114
    :goto_0
    return-object v0

    .line 111
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method private static final startRequest_aroundBody4(Lcom/disney/id/android/DIDSessionBase;Lcom/disney/id/android/DIDRequest;ZLorg/aspectj/lang/JoinPoint;)V
    .locals 3
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSessionBase;
    .param p1, "request"    # Lcom/disney/id/android/DIDRequest;
    .param p2, "silent"    # Z

    .prologue
    .line 181
    iget-object v1, p0, Lcom/disney/id/android/DIDSessionBase;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/disney/id/android/DIDWebUtils;->isConnected(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 182
    invoke-virtual {p1}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v1

    invoke-static {v1}, Lcom/disney/id/android/DIDWebUtils;->isOfflineRequest(I)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/disney/id/android/DIDSessionBase;->isSilent(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 184
    iget-object v1, p0, Lcom/disney/id/android/DIDSessionBase;->mDIDService:Lcom/disney/id/android/DIDService;

    invoke-virtual {v1, p1}, Lcom/disney/id/android/DIDService;->handleRequest(Lcom/disney/id/android/DIDRequest;)V

    .line 201
    :goto_0
    return-void

    .line 187
    :cond_0
    sget-object v1, Lcom/disney/id/android/DIDSessionBase;->TAG:Ljava/lang/String;

    invoke-static {v1}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "No network connection available."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    iget-object v1, p0, Lcom/disney/id/android/DIDSessionBase;->mContext:Landroid/content/Context;

    invoke-static {v1, p1}, Lcom/disney/id/android/DIDWebUtils;->reportNetworkError(Landroid/content/Context;Lcom/disney/id/android/DIDRequest;)V

    goto :goto_0

    .line 191
    :cond_1
    invoke-virtual {p1}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/disney/id/android/DIDSessionBase;->isSilent(I)Z

    move-result v1

    if-eqz v1, :cond_3

    if-eqz p2, :cond_3

    .line 192
    iget-boolean v1, p0, Lcom/disney/id/android/DIDSessionBase;->mIsBound:Z

    if-nez v1, :cond_2

    .line 193
    iget-object v1, p0, Lcom/disney/id/android/DIDSessionBase;->mRequestQueue:Ljava/util/Queue;

    invoke-interface {v1, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 195
    :cond_2
    iget-object v1, p0, Lcom/disney/id/android/DIDSessionBase;->mDIDService:Lcom/disney/id/android/DIDService;

    invoke-virtual {v1, p1}, Lcom/disney/id/android/DIDService;->handleRequest(Lcom/disney/id/android/DIDRequest;)V

    goto :goto_0

    .line 198
    :cond_3
    invoke-direct {p0, p1}, Lcom/disney/id/android/DIDSessionBase;->determineActivityToLaunch(Lcom/disney/id/android/DIDRequest;)Ljava/lang/Class;

    move-result-object v0

    .line 199
    .local v0, "activityToLaunch":Ljava/lang/Class;
    new-instance v1, Lcom/disney/id/android/DIDActivityLauncher;

    iget-object v2, p0, Lcom/disney/id/android/DIDSessionBase;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, v0}, Lcom/disney/id/android/DIDActivityLauncher;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, p1}, Lcom/disney/id/android/DIDActivityLauncher;->attemptLaunch(Lcom/disney/id/android/DIDRequest;)V

    goto :goto_0
.end method

.method private static final startRequest_aroundBody5$advice(Lcom/disney/id/android/DIDSessionBase;Lcom/disney/id/android/DIDRequest;ZLorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSessionBase;
    .param p1, "request"    # Lcom/disney/id/android/DIDRequest;
    .param p2, "silent"    # Z
    .param p3, "thisJoinPoint"    # Lorg/aspectj/lang/JoinPoint;
    .param p4, "ajc$aspectInstance"    # Lcom/disney/id/android/gintonic/aspect/TraceAspect;
    .param p5, "joinPoint"    # Lorg/aspectj/lang/ProceedingJoinPoint;

    .prologue
    .line 36
    invoke-interface {p5}, Lorg/aspectj/lang/ProceedingJoinPoint;->getSignature()Lorg/aspectj/lang/Signature;

    move-result-object v2

    check-cast v2, Lorg/aspectj/lang/reflect/MethodSignature;

    .line 37
    .local v2, "methodSignature":Lorg/aspectj/lang/reflect/MethodSignature;
    invoke-interface {v2}, Lorg/aspectj/lang/reflect/MethodSignature;->getDeclaringType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 38
    .local v0, "className":Ljava/lang/String;
    invoke-interface {v2}, Lorg/aspectj/lang/reflect/MethodSignature;->getName()Ljava/lang/String;

    move-result-object v1

    .line 40
    .local v1, "methodName":Ljava/lang/String;
    new-instance v4, Lcom/disney/id/android/gintonic/internal/StopWatch;

    invoke-direct {v4}, Lcom/disney/id/android/gintonic/internal/StopWatch;-><init>()V

    .line 41
    .local v4, "stopWatch":Lcom/disney/id/android/gintonic/internal/StopWatch;
    invoke-virtual {v4}, Lcom/disney/id/android/gintonic/internal/StopWatch;->start()V

    .line 42
    invoke-static {p0, p1, p2, p5}, Lcom/disney/id/android/DIDSessionBase;->startRequest_aroundBody4(Lcom/disney/id/android/DIDSessionBase;Lcom/disney/id/android/DIDRequest;ZLorg/aspectj/lang/JoinPoint;)V

    const/4 v3, 0x0

    .line 43
    .local v3, "result":Ljava/lang/Object;
    invoke-virtual {v4}, Lcom/disney/id/android/gintonic/internal/StopWatch;->stop()V

    .line 45
    invoke-virtual {v4}, Lcom/disney/id/android/gintonic/internal/StopWatch;->getTotalTimeMillis()J

    move-result-wide v6

    invoke-static {v1, v6, v7}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->ajc$inlineAccessMethod$com_disney_id_android_gintonic_aspect_TraceAspect$com_disney_id_android_gintonic_aspect_TraceAspect$buildLogMessage(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    return-object v3
.end method


# virtual methods
.method protected getJSON(Lcom/disney/id/android/DIDOptionalConfigs;)Lorg/json/JSONObject;
    .locals 3
    .param p1, "transactionalConfigs"    # Lcom/disney/id/android/DIDOptionalConfigs;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSessionBase;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/DIDSessionBase;->getJSON_aroundBody3$advice(Lcom/disney/id/android/DIDSessionBase;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    return-object v0
.end method

.method protected handleAdditionalAction(Lcom/disney/id/android/AdditionalAction;)V
    .locals 4
    .param p1, "additionalAction"    # Lcom/disney/id/android/AdditionalAction;

    .prologue
    const/16 v3, 0x204

    .line 219
    if-eqz p1, :cond_0

    .line 220
    invoke-virtual {p1}, Lcom/disney/id/android/AdditionalAction;->getInformation()Lorg/json/JSONObject;

    move-result-object v0

    .line 221
    .local v0, "payload":Lorg/json/JSONObject;
    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getDoNotDisturb()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_1

    .line 222
    invoke-virtual {p1}, Lcom/disney/id/android/AdditionalAction;->getInformation()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p0, v3, v1}, Lcom/disney/id/android/DIDSessionBase;->startRequest(ILorg/json/JSONObject;)V

    .line 227
    .end local v0    # "payload":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    return-void

    .line 224
    .restart local v0    # "payload":Lorg/json/JSONObject;
    :cond_1
    new-instance v1, Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v3, v2}, Lcom/disney/id/android/DIDRequest;-><init>(ILjava/lang/String;)V

    invoke-static {v1}, Lcom/disney/id/android/DIDSessionConfig;->setCanUseSiteRequest(Lcom/disney/id/android/DIDRequest;)V

    goto :goto_0
.end method

.method protected isAuthenticatedViaSocial()Z
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSessionBase;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/DIDSessionBase;->isAuthenticatedViaSocial_aroundBody1$advice(Lcom/disney/id/android/DIDSessionBase;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lorg/aspectj/runtime/internal/Conversions;->booleanValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected isSilent(I)Z
    .locals 1
    .param p1, "requestCode"    # I

    .prologue
    .line 215
    iget-boolean v0, p0, Lcom/disney/id/android/DIDSessionBase;->mIsBinding:Z

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/disney/id/android/DIDWebUtils;->isSilentRequest(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected startRequest(I)V
    .locals 1
    .param p1, "requestCode"    # I

    .prologue
    .line 154
    const/4 v0, 0x0

    check-cast v0, Lorg/json/JSONObject;

    invoke-virtual {p0, p1, v0}, Lcom/disney/id/android/DIDSessionBase;->startRequest(ILorg/json/JSONObject;)V

    .line 155
    return-void
.end method

.method protected startRequest(ILorg/json/JSONObject;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "params"    # Lorg/json/JSONObject;

    .prologue
    .line 164
    invoke-virtual {p0, p1}, Lcom/disney/id/android/DIDSessionBase;->isSilent(I)Z

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/disney/id/android/DIDSessionBase;->startRequest(ILorg/json/JSONObject;Z)V

    .line 165
    return-void
.end method

.method protected startRequest(ILorg/json/JSONObject;Z)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "params"    # Lorg/json/JSONObject;
    .param p3, "silent"    # Z

    .prologue
    .line 175
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    .line 176
    .local v0, "data":Ljava/lang/String;
    :goto_0
    new-instance v1, Lcom/disney/id/android/DIDRequest;

    invoke-direct {v1, p1, v0}, Lcom/disney/id/android/DIDRequest;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, v1, p3}, Lcom/disney/id/android/DIDSessionBase;->startRequest(Lcom/disney/id/android/DIDRequest;Z)V

    .line 177
    return-void

    .line 175
    .end local v0    # "data":Ljava/lang/String;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected startRequest(Lcom/disney/id/android/DIDRequest;Z)V
    .locals 6
    .param p1, "request"    # Lcom/disney/id/android/DIDRequest;
    .param p2, "silent"    # Z
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSessionBase;->ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {p2}, Lorg/aspectj/runtime/internal/Conversions;->booleanObject(Z)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, p0, p0, p1, v1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v3

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v4

    move-object v5, v3

    check-cast v5, Lorg/aspectj/lang/ProceedingJoinPoint;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    invoke-static/range {v0 .. v5}, Lcom/disney/id/android/DIDSessionBase;->startRequest_aroundBody5$advice(Lcom/disney/id/android/DIDSessionBase;Lcom/disney/id/android/DIDRequest;ZLorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method
