.class public final Lcom/disney/id/android/DIDSessionConfig;
.super Ljava/lang/Object;
.source "DIDSessionConfig.java"


# static fields
.field private static final SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

.field private static final TAG:Ljava/lang/String;

.field private static final ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->ajc$preClinit()V

    .line 13
    new-instance v0, Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-direct {v0}, Lcom/disney/id/android/DIDSessionConfigInstance;-><init>()V

    sput-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 14
    const-class v0, Lcom/disney/id/android/DIDSessionConfig;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDSessionConfig;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static ajc$preClinit()V
    .locals 9

    .prologue
    .line 1
    new-instance v0, Lorg/aspectj/runtime/reflect/Factory;

    const-string v1, "DIDSessionConfig.java"

    const-class v2, Lcom/disney/id/android/DIDSessionConfig;

    invoke-direct {v0, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    const-string v8, "method-execution"

    const-string v1, "9"

    const-string v2, "loadConfig"

    const-string v3, "com.disney.id.android.DIDSessionConfig"

    const-string v4, "android.content.Context"

    const-string v5, "context"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x12

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDSessionConfig;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "9"

    const-string v2, "getLBBaseUrl"

    const-string v3, "com.disney.id.android.DIDSessionConfig"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "java.lang.String"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x88

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDSessionConfig;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "9"

    const-string v2, "getGCBaseUrl"

    const-string v3, "com.disney.id.android.DIDSessionConfig"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "java.lang.String"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x92

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDSessionConfig;->ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

    return-void
.end method

.method public static getCanUseSite()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 114
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSessionConfigInstance;->getCanUseSiteRequest()Lcom/disney/id/android/DIDRequest;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static getCanUseSiteRequest()Lcom/disney/id/android/DIDRequest;
    .locals 1

    .prologue
    .line 122
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSessionConfigInstance;->getCanUseSiteRequest()Lcom/disney/id/android/DIDRequest;

    move-result-object v0

    return-object v0
.end method

.method public static getClientId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSessionConfigInstance;->getClientId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCoreServicesEnv()Ljava/lang/String;
    .locals 1

    .prologue
    .line 126
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSessionConfigInstance;->getCoreServicesEnv()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCountryPreference()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSessionConfigInstance;->getCountryPreference()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCssOverrideUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSessionConfigInstance;->getCssOverrideUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getDebug()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 71
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSessionConfigInstance;->getDebug()Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public static getDefaultLanguagePreference()Ljava/lang/String;
    .locals 1

    .prologue
    .line 50
    const-string v0, "en-US"

    return-object v0
.end method

.method public static getDoNotDisturb()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 95
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSessionConfigInstance;->getDoNotDisturb()Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public static getEnv()Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSessionConfigInstance;->getEnv()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getGCBaseUrl()Ljava/lang/String;
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, v1, v1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {v1, v2, v0}, Lcom/disney/id/android/DIDSessionConfig;->getGCBaseUrl_aroundBody5$advice(Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method private static final getGCBaseUrl_aroundBody4(Lorg/aspectj/lang/JoinPoint;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 146
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSessionConfigInstance;->getGuestControllerBaseUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static final getGCBaseUrl_aroundBody5$advice(Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "thisJoinPoint"    # Lorg/aspectj/lang/JoinPoint;
    .param p1, "ajc$aspectInstance"    # Lcom/disney/id/android/gintonic/aspect/TraceAspect;
    .param p2, "joinPoint"    # Lorg/aspectj/lang/ProceedingJoinPoint;

    .prologue
    .line 36
    invoke-interface {p2}, Lorg/aspectj/lang/ProceedingJoinPoint;->getSignature()Lorg/aspectj/lang/Signature;

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
    invoke-static {p2}, Lcom/disney/id/android/DIDSessionConfig;->getGCBaseUrl_aroundBody4(Lorg/aspectj/lang/JoinPoint;)Ljava/lang/String;

    move-result-object v3

    .line 43
    .local v3, "result":Ljava/lang/String;
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

.method public static getLBBaseUrl()Ljava/lang/String;
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, v1, v1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {v1, v2, v0}, Lcom/disney/id/android/DIDSessionConfig;->getLBBaseUrl_aroundBody3$advice(Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method private static final getLBBaseUrl_aroundBody2(Lorg/aspectj/lang/JoinPoint;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 136
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSessionConfigInstance;->getLightBoxBaseUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static final getLBBaseUrl_aroundBody3$advice(Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "thisJoinPoint"    # Lorg/aspectj/lang/JoinPoint;
    .param p1, "ajc$aspectInstance"    # Lcom/disney/id/android/gintonic/aspect/TraceAspect;
    .param p2, "joinPoint"    # Lorg/aspectj/lang/ProceedingJoinPoint;

    .prologue
    .line 36
    invoke-interface {p2}, Lorg/aspectj/lang/ProceedingJoinPoint;->getSignature()Lorg/aspectj/lang/Signature;

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
    invoke-static {p2}, Lcom/disney/id/android/DIDSessionConfig;->getLBBaseUrl_aroundBody2(Lorg/aspectj/lang/JoinPoint;)Ljava/lang/String;

    move-result-object v3

    .line 43
    .local v3, "result":Ljava/lang/String;
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

.method public static getLanguagePreference()Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSessionConfigInstance;->getLanguagePreference()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isStatusBarHidden()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 79
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDSessionConfigInstance;->isStatusBarHidden()Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public static loadConfig(Landroid/content/Context;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, v1, v1, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/DIDSessionConfig;->loadConfig_aroundBody1$advice(Landroid/content/Context;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method private static final loadConfig_aroundBody0(Landroid/content/Context;Lorg/aspectj/lang/JoinPoint;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 18
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0, p0}, Lcom/disney/id/android/DIDSessionConfigInstance;->mergeMetaData(Landroid/content/Context;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 19
    return-void
.end method

.method private static final loadConfig_aroundBody1$advice(Landroid/content/Context;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/DIDSessionConfig;->loadConfig_aroundBody0(Landroid/content/Context;Lorg/aspectj/lang/JoinPoint;)V

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

.method static setCanUseSiteRequest(Lcom/disney/id/android/DIDRequest;)V
    .locals 1
    .param p0, "canUseSiteRequest"    # Lcom/disney/id/android/DIDRequest;

    .prologue
    .line 118
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0, p0}, Lcom/disney/id/android/DIDSessionConfigInstance;->setCanUseSiteRequest(Lcom/disney/id/android/DIDRequest;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 119
    return-void
.end method

.method public static setClientId(Ljava/lang/String;)V
    .locals 1
    .param p0, "clientId"    # Ljava/lang/String;

    .prologue
    .line 34
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0, p0}, Lcom/disney/id/android/DIDSessionConfigInstance;->setClientId(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 35
    return-void
.end method

.method public static setCountryPreference(Ljava/lang/String;)V
    .locals 1
    .param p0, "countryPref"    # Ljava/lang/String;

    .prologue
    .line 67
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0, p0}, Lcom/disney/id/android/DIDSessionConfigInstance;->setCountryPreference(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 68
    return-void
.end method

.method public static setCssOverrideUrl(Ljava/lang/String;)V
    .locals 1
    .param p0, "cssOverride"    # Ljava/lang/String;

    .prologue
    .line 42
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0, p0}, Lcom/disney/id/android/DIDSessionConfigInstance;->setCssOverrideUrl(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 43
    return-void
.end method

.method public static setDebug(Ljava/lang/Boolean;)V
    .locals 1
    .param p0, "debug"    # Ljava/lang/Boolean;

    .prologue
    .line 75
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0, p0}, Lcom/disney/id/android/DIDSessionConfigInstance;->setDebug(Ljava/lang/Boolean;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 76
    return-void
.end method

.method static setDoNotDisturb(Ljava/lang/Boolean;)V
    .locals 1
    .param p0, "doNotDisturb"    # Ljava/lang/Boolean;

    .prologue
    .line 107
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0, p0}, Lcom/disney/id/android/DIDSessionConfigInstance;->setDoNotDisturb(Ljava/lang/Boolean;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 108
    return-void
.end method

.method public static setEnv(Ljava/lang/String;)V
    .locals 1
    .param p0, "env"    # Ljava/lang/String;

    .prologue
    .line 26
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0, p0}, Lcom/disney/id/android/DIDSessionConfigInstance;->setEnv(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 27
    return-void
.end method

.method public static setLanguagePreference(Ljava/lang/String;)V
    .locals 1
    .param p0, "langPref"    # Ljava/lang/String;

    .prologue
    .line 59
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0, p0}, Lcom/disney/id/android/DIDSessionConfigInstance;->setLanguagePreference(Ljava/lang/String;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 60
    return-void
.end method

.method public static setStatusBarHidden(Ljava/lang/Boolean;)V
    .locals 1
    .param p0, "hideStatusBar"    # Ljava/lang/Boolean;

    .prologue
    .line 83
    sget-object v0, Lcom/disney/id/android/DIDSessionConfig;->SINGLETON_CONFIG_INSTANCE:Lcom/disney/id/android/DIDSessionConfigInstance;

    invoke-virtual {v0, p0}, Lcom/disney/id/android/DIDSessionConfigInstance;->setStatusBarHidden(Ljava/lang/Boolean;)Lcom/disney/id/android/DIDSessionConfigInstance;

    .line 84
    return-void
.end method
