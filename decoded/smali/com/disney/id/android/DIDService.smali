.class public Lcom/disney/id/android/DIDService;
.super Landroid/app/Service;
.source "DIDService.java"

# interfaces
.implements Lcom/disney/id/android/DIDReachability$DIDReachabilityListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/id/android/DIDService$RefreshRunnable;,
        Lcom/disney/id/android/DIDService$DIDWebReceiver;,
        Lcom/disney/id/android/DIDService$SessionBinder;,
        Lcom/disney/id/android/DIDService$CustomHandler;
    }
.end annotation


# static fields
.field private static final INTERNAL_FAILED_REFRESH_PERCENTAGE:D = 0.2

.field private static final INTERNAL_REFRESH_PERCENTAGE:D = 0.9

.field private static final TAG:Ljava/lang/String;

.field private static final THIRTY_SECONDS:J

.field private static final ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_3:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_4:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_5:Lorg/aspectj/lang/JoinPoint$StaticPart;


# instance fields
.field private lowTrustHandle:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture",
            "<*>;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field private final mDIDReachability:Lcom/disney/id/android/DIDReachability;

.field private final mDIDWebReceiver:Lcom/disney/id/android/DIDService$DIDWebReceiver;

.field private mDIDWebTokenManager:Lcom/disney/id/android/DIDTokenManager;

.field private mHandler:Landroid/os/Handler;

.field private mHandlerThread:Landroid/os/HandlerThread;

.field private final myBinder:Landroid/os/IBinder;

.field private refreshHandle:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture",
            "<*>;"
        }
    .end annotation
.end field

.field private final scheduler:Ljava/util/concurrent/ScheduledExecutorService;

.field private final silentMethodSemaphore:Ljava/util/concurrent/Semaphore;

.field private tokenRefreshScheduled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    invoke-static {}, Lcom/disney/id/android/DIDService;->ajc$preClinit()V

    .line 32
    const-class v0, Lcom/disney/id/android/DIDService;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDService;->TAG:Ljava/lang/String;

    .line 67
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x1e

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    sput-wide v0, Lcom/disney/id/android/DIDService;->THIRTY_SECONDS:J

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 31
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 39
    new-instance v0, Ljava/util/concurrent/Semaphore;

    invoke-direct {v0, v2}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Lcom/disney/id/android/DIDService;->silentMethodSemaphore:Ljava/util/concurrent/Semaphore;

    .line 59
    new-instance v0, Lcom/disney/id/android/DIDService$DIDWebReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/disney/id/android/DIDService$DIDWebReceiver;-><init>(Lcom/disney/id/android/DIDService;Lcom/disney/id/android/DIDService$1;)V

    iput-object v0, p0, Lcom/disney/id/android/DIDService;->mDIDWebReceiver:Lcom/disney/id/android/DIDService$DIDWebReceiver;

    .line 60
    new-instance v0, Lcom/disney/id/android/DIDReachability;

    invoke-direct {v0}, Lcom/disney/id/android/DIDReachability;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/DIDService;->mDIDReachability:Lcom/disney/id/android/DIDReachability;

    .line 62
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/id/android/DIDService;->tokenRefreshScheduled:Z

    .line 64
    invoke-static {v2}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(I)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/DIDService;->scheduler:Ljava/util/concurrent/ScheduledExecutorService;

    .line 71
    new-instance v0, Lcom/disney/id/android/DIDService$SessionBinder;

    invoke-direct {v0, p0}, Lcom/disney/id/android/DIDService$SessionBinder;-><init>(Lcom/disney/id/android/DIDService;)V

    iput-object v0, p0, Lcom/disney/id/android/DIDService;->myBinder:Landroid/os/IBinder;

    .line 285
    return-void
.end method

.method static synthetic access$000(Lcom/disney/id/android/DIDService;Lcom/disney/id/android/DIDRequest;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/DIDService;
    .param p1, "x1"    # Lcom/disney/id/android/DIDRequest;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/disney/id/android/DIDService;->executeRequest(Lcom/disney/id/android/DIDRequest;)V

    return-void
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/disney/id/android/DIDService;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/disney/id/android/DIDService;)Ljava/util/concurrent/Semaphore;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/DIDService;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/disney/id/android/DIDService;->silentMethodSemaphore:Ljava/util/concurrent/Semaphore;

    return-object v0
.end method

.method static synthetic access$400(Lcom/disney/id/android/DIDService;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/DIDService;
    .param p1, "x1"    # Z

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/disney/id/android/DIDService;->scheduleTokenRefresh(Z)V

    return-void
.end method

.method static synthetic access$500(Lcom/disney/id/android/DIDService;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/DIDService;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/disney/id/android/DIDService;->handleLogout()V

    return-void
.end method

.method static synthetic access$600(Lcom/disney/id/android/DIDService;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/DIDService;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/disney/id/android/DIDService;->scheduleLowTrust()V

    return-void
.end method

.method static synthetic access$700(Lcom/disney/id/android/DIDService;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/DIDService;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/disney/id/android/DIDService;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$800(Lcom/disney/id/android/DIDService;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/DIDService;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/disney/id/android/DIDService;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private static ajc$preClinit()V
    .locals 9

    .prologue
    .line 1
    new-instance v0, Lorg/aspectj/runtime/reflect/Factory;

    const-string v1, "DIDService.java"

    const-class v2, Lcom/disney/id/android/DIDService;

    invoke-direct {v0, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "onCreate"

    const-string v3, "com.disney.id.android.DIDService"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x55

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDService;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "onDestroy"

    const-string v3, "com.disney.id.android.DIDService"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x6e

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDService;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "handleRequest"

    const-string v3, "com.disney.id.android.DIDService"

    const-string v4, "com.disney.id.android.DIDRequest"

    const-string v5, "request"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x84

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDService;->ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "2"

    const-string v2, "executeRequest"

    const-string v3, "com.disney.id.android.DIDService"

    const-string v4, "com.disney.id.android.DIDRequest"

    const-string v5, "request"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x8b

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDService;->ajc$tjp_3:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "onStart"

    const-string v3, "com.disney.id.android.DIDService"

    const-string v4, "android.content.Intent:int"

    const-string v5, "intent:startId"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x9b

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDService;->ajc$tjp_4:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "onStartCommand"

    const-string v3, "com.disney.id.android.DIDService"

    const-string v4, "android.content.Intent:int:int"

    const-string v5, "intent:flags:startId"

    const-string v6, ""

    const-string v7, "int"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xa2

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDService;->ajc$tjp_5:Lorg/aspectj/lang/JoinPoint$StaticPart;

    return-void
.end method

.method private cancelLowTrust()V
    .locals 2

    .prologue
    .line 247
    iget-object v0, p0, Lcom/disney/id/android/DIDService;->lowTrustHandle:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_0

    .line 248
    iget-object v0, p0, Lcom/disney/id/android/DIDService;->lowTrustHandle:Ljava/util/concurrent/ScheduledFuture;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 249
    :cond_0
    return-void
.end method

.method private cancelTokenRefresh()V
    .locals 2

    .prologue
    .line 280
    iget-object v0, p0, Lcom/disney/id/android/DIDService;->refreshHandle:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v0, :cond_0

    .line 281
    iget-object v0, p0, Lcom/disney/id/android/DIDService;->refreshHandle:Ljava/util/concurrent/ScheduledFuture;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    .line 282
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/id/android/DIDService;->tokenRefreshScheduled:Z

    .line 283
    return-void
.end method

.method private executeRequest(Lcom/disney/id/android/DIDRequest;)V
    .locals 3
    .param p1, "request"    # Lcom/disney/id/android/DIDRequest;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDService;->ajc$tjp_3:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/DIDService;->executeRequest_aroundBody7$advice(Lcom/disney/id/android/DIDService;Lcom/disney/id/android/DIDRequest;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method private static final executeRequest_aroundBody6(Lcom/disney/id/android/DIDService;Lcom/disney/id/android/DIDRequest;Lorg/aspectj/lang/JoinPoint;)V
    .locals 1
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDService;
    .param p1, "request"    # Lcom/disney/id/android/DIDRequest;

    .prologue
    .line 139
    iget-object v0, p0, Lcom/disney/id/android/DIDService;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/disney/id/android/DIDWebUtils;->isConnected(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v0

    invoke-static {v0}, Lcom/disney/id/android/DIDWebUtils;->isOfflineRequest(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 142
    iget-object v0, p0, Lcom/disney/id/android/DIDService;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/disney/id/android/DIDWebUtils;->reportNetworkError(Landroid/content/Context;Lcom/disney/id/android/DIDRequest;)V

    .line 146
    :goto_0
    return-void

    .line 144
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/DIDService;->mDIDWebTokenManager:Lcom/disney/id/android/DIDTokenManager;

    invoke-virtual {v0, p1}, Lcom/disney/id/android/DIDTokenManager;->handleRequest(Lcom/disney/id/android/DIDRequest;)V

    goto :goto_0
.end method

.method private static final executeRequest_aroundBody7$advice(Lcom/disney/id/android/DIDService;Lcom/disney/id/android/DIDRequest;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDService;
    .param p1, "request"    # Lcom/disney/id/android/DIDRequest;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/DIDService;->executeRequest_aroundBody6(Lcom/disney/id/android/DIDService;Lcom/disney/id/android/DIDRequest;Lorg/aspectj/lang/JoinPoint;)V

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

.method private handleLogout()V
    .locals 4

    .prologue
    .line 214
    invoke-direct {p0}, Lcom/disney/id/android/DIDService;->cancelTokenRefresh()V

    .line 215
    new-instance v1, Lcom/disney/id/android/DIDRequest;

    const/16 v2, 0x200

    invoke-direct {v1, v2}, Lcom/disney/id/android/DIDRequest;-><init>(I)V

    .line 217
    .local v1, "request":Lcom/disney/id/android/DIDRequest;
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->getInstance()Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;

    move-result-object v2

    iget-object v3, p0, Lcom/disney/id/android/DIDService;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->getCachedLightBoxInteraction(Landroid/content/Context;)Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    move-result-object v0

    .line 219
    .local v0, "lightBoxInteraction":Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;
    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->handleLogout()V

    .line 220
    return-void
.end method

.method private static final handleRequest_aroundBody4(Lcom/disney/id/android/DIDService;Lcom/disney/id/android/DIDRequest;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDService;
    .param p1, "request"    # Lcom/disney/id/android/DIDRequest;

    .prologue
    .line 132
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 133
    .local v0, "msg":Landroid/os/Message;
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 134
    iget-object v1, p0, Lcom/disney/id/android/DIDService;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 135
    return-void
.end method

.method private static final handleRequest_aroundBody5$advice(Lcom/disney/id/android/DIDService;Lcom/disney/id/android/DIDRequest;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDService;
    .param p1, "request"    # Lcom/disney/id/android/DIDRequest;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/DIDService;->handleRequest_aroundBody4(Lcom/disney/id/android/DIDService;Lcom/disney/id/android/DIDRequest;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final onCreate_aroundBody0(Lcom/disney/id/android/DIDService;Lorg/aspectj/lang/JoinPoint;)V
    .locals 4
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDService;

    .prologue
    .line 85
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 87
    iput-object p0, p0, Lcom/disney/id/android/DIDService;->mContext:Landroid/content/Context;

    .line 88
    new-instance v1, Landroid/os/HandlerThread;

    sget-object v2, Lcom/disney/id/android/DIDService;->TAG:Ljava/lang/String;

    const/16 v3, 0xa

    invoke-direct {v1, v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    iput-object v1, p0, Lcom/disney/id/android/DIDService;->mHandlerThread:Landroid/os/HandlerThread;

    .line 89
    iget-object v1, p0, Lcom/disney/id/android/DIDService;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    .line 91
    new-instance v1, Lcom/disney/id/android/DIDService$CustomHandler;

    iget-object v2, p0, Lcom/disney/id/android/DIDService;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2, p0}, Lcom/disney/id/android/DIDService$CustomHandler;-><init>(Landroid/os/Looper;Lcom/disney/id/android/DIDService;)V

    iput-object v1, p0, Lcom/disney/id/android/DIDService;->mHandler:Landroid/os/Handler;

    .line 93
    new-instance v1, Lcom/disney/id/android/DIDTokenManager;

    iget-object v2, p0, Lcom/disney/id/android/DIDService;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/disney/id/android/DIDTokenManager;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/disney/id/android/DIDService;->mDIDWebTokenManager:Lcom/disney/id/android/DIDTokenManager;

    .line 95
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "com.disney.id.android.ACTION"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 97
    .local v0, "intentFilter":Landroid/content/IntentFilter;
    iget-object v1, p0, Lcom/disney/id/android/DIDService;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/id/android/DIDService;->mDIDWebReceiver:Lcom/disney/id/android/DIDService$DIDWebReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 100
    iget-object v1, p0, Lcom/disney/id/android/DIDService;->mDIDReachability:Lcom/disney/id/android/DIDReachability;

    iget-object v2, p0, Lcom/disney/id/android/DIDService;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v2, p0}, Lcom/disney/id/android/DIDReachability;->registerContext(Landroid/content/Context;Lcom/disney/id/android/DIDReachability$DIDReachabilityListener;)V

    .line 102
    iget-object v1, p0, Lcom/disney/id/android/DIDService;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/disney/id/android/DIDStateManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDStateManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDStateManager;->trackInit()V

    .line 104
    invoke-direct {p0}, Lcom/disney/id/android/DIDService;->scheduleLowTrust()V

    .line 105
    return-void
.end method

.method private static final onCreate_aroundBody1$advice(Lcom/disney/id/android/DIDService;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDService;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/DIDService;->onCreate_aroundBody0(Lcom/disney/id/android/DIDService;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final onDestroy_aroundBody2(Lcom/disney/id/android/DIDService;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDService;

    .prologue
    .line 110
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 112
    iget-object v0, p0, Lcom/disney/id/android/DIDService;->mHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 114
    invoke-direct {p0}, Lcom/disney/id/android/DIDService;->cancelTokenRefresh()V

    .line 115
    invoke-direct {p0}, Lcom/disney/id/android/DIDService;->cancelLowTrust()V

    .line 117
    iget-object v0, p0, Lcom/disney/id/android/DIDService;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/DIDService;->mDIDWebReceiver:Lcom/disney/id/android/DIDService$DIDWebReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 120
    iget-object v0, p0, Lcom/disney/id/android/DIDService;->mDIDReachability:Lcom/disney/id/android/DIDReachability;

    iget-object v1, p0, Lcom/disney/id/android/DIDService;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDReachability;->unregisterContext(Landroid/content/Context;)V

    .line 122
    iget-object v0, p0, Lcom/disney/id/android/DIDService;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->term()V

    .line 123
    return-void
.end method

.method private static final onDestroy_aroundBody3$advice(Lcom/disney/id/android/DIDService;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDService;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/DIDService;->onDestroy_aroundBody2(Lcom/disney/id/android/DIDService;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final onStartCommand_aroundBody10(Lcom/disney/id/android/DIDService;Landroid/content/Intent;IILorg/aspectj/lang/JoinPoint;)I
    .locals 1
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDService;
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 162
    const/4 v0, 0x1

    return v0
.end method

.method private static final onStartCommand_aroundBody11$advice(Lcom/disney/id/android/DIDService;Landroid/content/Intent;IILorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDService;
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I
    .param p4, "thisJoinPoint"    # Lorg/aspectj/lang/JoinPoint;
    .param p5, "ajc$aspectInstance"    # Lcom/disney/id/android/gintonic/aspect/TraceAspect;
    .param p6, "joinPoint"    # Lorg/aspectj/lang/ProceedingJoinPoint;

    .prologue
    .line 36
    invoke-interface {p6}, Lorg/aspectj/lang/ProceedingJoinPoint;->getSignature()Lorg/aspectj/lang/Signature;

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
    invoke-static {p0, p1, p2, p3, p6}, Lcom/disney/id/android/DIDService;->onStartCommand_aroundBody10(Lcom/disney/id/android/DIDService;Landroid/content/Intent;IILorg/aspectj/lang/JoinPoint;)I

    move-result v5

    invoke-static {v5}, Lorg/aspectj/runtime/internal/Conversions;->intObject(I)Ljava/lang/Object;

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

.method private static final onStart_aroundBody8(Lcom/disney/id/android/DIDService;Landroid/content/Intent;ILorg/aspectj/lang/JoinPoint;)V
    .locals 0

    .prologue
    .line 155
    return-void
.end method

.method private static final onStart_aroundBody9$advice(Lcom/disney/id/android/DIDService;Landroid/content/Intent;ILorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDService;
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "startId"    # I
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
    invoke-static {p0, p1, p2, p5}, Lcom/disney/id/android/DIDService;->onStart_aroundBody8(Lcom/disney/id/android/DIDService;Landroid/content/Intent;ILorg/aspectj/lang/JoinPoint;)V

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

.method private scheduleLowTrust()V
    .locals 6

    .prologue
    .line 223
    invoke-direct {p0}, Lcom/disney/id/android/DIDService;->cancelLowTrust()V

    .line 224
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->hasToken()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDToken;->getLowTrust()Z

    move-result v1

    if-nez v1, :cond_0

    .line 226
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDToken;->secondsUntilLowTrust()J

    move-result-wide v2

    .line 227
    .local v2, "lowTrustSec":J
    sget-object v1, Lcom/disney/id/android/DIDService;->TAG:Ljava/lang/String;

    invoke-static {v1}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Scheduling low trust in "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " sec"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    :try_start_0
    iget-object v1, p0, Lcom/disney/id/android/DIDService;->scheduler:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v4, Lcom/disney/id/android/DIDService$1;

    invoke-direct {v4, p0}, Lcom/disney/id/android/DIDService$1;-><init>(Lcom/disney/id/android/DIDService;)V

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v4, v2, v3, v5}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v1

    iput-object v1, p0, Lcom/disney/id/android/DIDService;->lowTrustHandle:Ljava/util/concurrent/ScheduledFuture;
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 244
    .end local v2    # "lowTrustSec":J
    :cond_0
    :goto_0
    return-void

    .line 240
    .restart local v2    # "lowTrustSec":J
    :catch_0
    move-exception v0

    .line 241
    .local v0, "ignore":Ljava/util/concurrent/RejectedExecutionException;
    sget-object v1, Lcom/disney/id/android/DIDService;->TAG:Ljava/lang/String;

    const-string v4, "Unexpected exception"

    invoke-static {v1, v4, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private scheduleTokenRefresh(Z)V
    .locals 8
    .param p1, "onFailure"    # Z

    .prologue
    .line 252
    invoke-direct {p0}, Lcom/disney/id/android/DIDService;->cancelTokenRefresh()V

    .line 253
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/DIDGuest;->hasToken()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/DIDToken;->hasTTL()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/DIDToken;->hasCreated()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/DIDToken;->hasRefreshToken()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/DIDToken;->hasBlueCookie()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 258
    :cond_0
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v4

    invoke-virtual {v4}, Lcom/disney/id/android/DIDToken;->secondsUntilTokenExpiration()J

    move-result-wide v0

    .line 259
    .local v0, "expireTimeSec":J
    const/16 v3, 0x203

    .line 261
    .local v3, "requestCode":I
    sget-wide v4, Lcom/disney/id/android/DIDService;->THIRTY_SECONDS:J

    cmp-long v4, v0, v4

    if-gtz v4, :cond_2

    .line 262
    const/16 v3, 0x202

    .line 268
    :goto_0
    sget-object v4, Lcom/disney/id/android/DIDService;->TAG:Ljava/lang/String;

    invoke-static {v4}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Scheduling token refresh in "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " sec"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 270
    :try_start_0
    iget-object v4, p0, Lcom/disney/id/android/DIDService;->scheduler:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v5, Lcom/disney/id/android/DIDService$RefreshRunnable;

    new-instance v6, Lcom/disney/id/android/DIDRequest;

    invoke-direct {v6, v3}, Lcom/disney/id/android/DIDRequest;-><init>(I)V

    invoke-direct {v5, p0, v6}, Lcom/disney/id/android/DIDService$RefreshRunnable;-><init>(Lcom/disney/id/android/DIDService;Lcom/disney/id/android/DIDRequest;)V

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v4, v5, v0, v1, v6}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v4

    iput-object v4, p0, Lcom/disney/id/android/DIDService;->refreshHandle:Ljava/util/concurrent/ScheduledFuture;

    .line 272
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/disney/id/android/DIDService;->tokenRefreshScheduled:Z
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 277
    .end local v0    # "expireTimeSec":J
    .end local v3    # "requestCode":I
    :cond_1
    :goto_1
    return-void

    .line 263
    .restart local v0    # "expireTimeSec":J
    .restart local v3    # "requestCode":I
    :cond_2
    if-eqz p1, :cond_3

    .line 264
    const-wide v4, 0x3fc999999999999aL    # 0.2

    long-to-double v6, v0

    mul-double/2addr v4, v6

    double-to-long v4, v4

    long-to-float v4, v4

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    int-to-long v0, v4

    goto :goto_0

    .line 266
    :cond_3
    const-wide v4, 0x3feccccccccccccdL    # 0.9

    long-to-double v6, v0

    mul-double/2addr v4, v6

    double-to-long v4, v4

    long-to-float v4, v4

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    int-to-long v0, v4

    goto :goto_0

    .line 273
    :catch_0
    move-exception v2

    .line 274
    .local v2, "ignore":Ljava/util/concurrent/RejectedExecutionException;
    sget-object v4, Lcom/disney/id/android/DIDService;->TAG:Ljava/lang/String;

    const-string v5, "Unexpected exception"

    invoke-static {v4, v5, v2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method


# virtual methods
.method public handleRequest(Lcom/disney/id/android/DIDRequest;)V
    .locals 3
    .param p1, "request"    # Lcom/disney/id/android/DIDRequest;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDService;->ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/DIDService;->handleRequest_aroundBody5$advice(Lcom/disney/id/android/DIDService;Lcom/disney/id/android/DIDRequest;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 127
    iget-object v0, p0, Lcom/disney/id/android/DIDService;->myBinder:Landroid/os/IBinder;

    return-object v0
.end method

.method public onCreate()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDService;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/DIDService;->onCreate_aroundBody1$advice(Lcom/disney/id/android/DIDService;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public onDestroy()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDService;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/DIDService;->onDestroy_aroundBody3$advice(Lcom/disney/id/android/DIDService;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public onNetworkReachabilityChange(Z)V
    .locals 2
    .param p1, "connected"    # Z

    .prologue
    const/4 v1, 0x0

    .line 310
    iget-boolean v0, p0, Lcom/disney/id/android/DIDService;->tokenRefreshScheduled:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    and-int/2addr v0, p1

    if-eqz v0, :cond_2

    .line 311
    invoke-direct {p0, v1}, Lcom/disney/id/android/DIDService;->scheduleTokenRefresh(Z)V

    .line 314
    :cond_0
    :goto_1
    return-void

    :cond_1
    move v0, v1

    .line 310
    goto :goto_0

    .line 312
    :cond_2
    if-nez p1, :cond_0

    .line 313
    invoke-direct {p0}, Lcom/disney/id/android/DIDService;->cancelTokenRefresh()V

    goto :goto_1
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 6
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "startId"    # I
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDService;->ajc$tjp_4:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {p2}, Lorg/aspectj/runtime/internal/Conversions;->intObject(I)Ljava/lang/Object;

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

    invoke-static/range {v0 .. v5}, Lcom/disney/id/android/DIDService;->onStart_aroundBody9$advice(Lcom/disney/id/android/DIDService;Landroid/content/Intent;ILorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 7
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDService;->ajc$tjp_5:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    invoke-static {p2}, Lorg/aspectj/runtime/internal/Conversions;->intObject(I)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p3}, Lorg/aspectj/runtime/internal/Conversions;->intObject(I)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, p0, p0, v1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v4

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v5

    move-object v6, v4

    check-cast v6, Lorg/aspectj/lang/ProceedingJoinPoint;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-static/range {v0 .. v6}, Lcom/disney/id/android/DIDService;->onStartCommand_aroundBody11$advice(Lcom/disney/id/android/DIDService;Landroid/content/Intent;IILorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lorg/aspectj/runtime/internal/Conversions;->intValue(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method
