.class public Lcom/disney/id/android/DIDSessionManager;
.super Ljava/lang/Object;
.source "DIDSessionManager.java"

# interfaces
.implements Lcom/disney/id/android/log/DIDEventParams;


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static activeSession:Lcom/disney/id/android/DIDSessionManager;

.field private static final ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static mContext:Landroid/content/Context;


# instance fields
.field private final callbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/disney/id/android/DIDSessionDelegate;",
            ">;"
        }
    .end annotation
.end field

.field private final handler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    invoke-static {}, Lcom/disney/id/android/DIDSessionManager;->ajc$preClinit()V

    .line 19
    const-class v0, Lcom/disney/id/android/DIDSessionManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDSessionManager;->TAG:Ljava/lang/String;

    .line 21
    const/4 v0, 0x0

    sput-object v0, Lcom/disney/id/android/DIDSessionManager;->activeSession:Lcom/disney/id/android/DIDSessionManager;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDSessionManager;->mContext:Landroid/content/Context;

    .line 28
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/disney/id/android/DIDSessionManager;->handler:Landroid/os/Handler;

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/DIDSessionManager;->callbacks:Ljava/util/List;

    .line 30
    return-void
.end method

.method static synthetic access$000(Lcom/disney/id/android/DIDSessionManager;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/DIDSessionManager;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager;->callbacks:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 18
    sget-object v0, Lcom/disney/id/android/DIDSessionManager;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/disney/id/android/DIDSessionManager;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/DIDSessionManager;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method private static ajc$preClinit()V
    .locals 9

    .prologue
    .line 1
    new-instance v0, Lorg/aspectj/runtime/reflect/Factory;

    const-string v1, "DIDSessionManager.java"

    const-class v2, Lcom/disney/id/android/DIDSessionManager;

    invoke-direct {v0, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "sendResponse"

    const-string v3, "com.disney.id.android.DIDSessionManager"

    const-string v4, "com.disney.id.android.DIDResponse"

    const-string v5, "response"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x4e

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDSessionManager;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDSessionManager;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 39
    sget-object v0, Lcom/disney/id/android/DIDSessionManager;->activeSession:Lcom/disney/id/android/DIDSessionManager;

    if-nez v0, :cond_0

    .line 40
    new-instance v0, Lcom/disney/id/android/DIDSessionManager;

    invoke-direct {v0, p0}, Lcom/disney/id/android/DIDSessionManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/disney/id/android/DIDSessionManager;->activeSession:Lcom/disney/id/android/DIDSessionManager;

    .line 42
    :cond_0
    sget-object v0, Lcom/disney/id/android/DIDSessionManager;->activeSession:Lcom/disney/id/android/DIDSessionManager;

    return-object v0
.end method

.method private static final sendResponse_aroundBody0(Lcom/disney/id/android/DIDSessionManager;Lcom/disney/id/android/DIDResponse;Lorg/aspectj/lang/JoinPoint;)V
    .locals 4
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSessionManager;
    .param p1, "response"    # Lcom/disney/id/android/DIDResponse;

    .prologue
    .line 78
    sget-object v2, Lcom/disney/id/android/DIDSessionManager;->TAG:Ljava/lang/String;

    invoke-static {v2}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/disney/id/android/DIDResponse;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    new-instance v0, Landroid/content/Intent;

    const-string v2, "com.disney.id.android.ACTION"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 82
    .local v0, "resultIntent":Landroid/content/Intent;
    const-string v2, "com.disney.id.android.REQUEST"

    invoke-virtual {p1}, Lcom/disney/id/android/DIDResponse;->getRequest()Lcom/disney/id/android/DIDRequest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 83
    const-string v2, "com.disney.id.android.RESULT"

    invoke-virtual {p1}, Lcom/disney/id/android/DIDResponse;->getResponseCode()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 84
    sget-object v2, Lcom/disney/id/android/DIDSessionManager;->mContext:Landroid/content/Context;

    invoke-static {v2}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 87
    invoke-virtual {p1}, Lcom/disney/id/android/DIDResponse;->getRequest()Lcom/disney/id/android/DIDRequest;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v2

    invoke-static {v2}, Lcom/disney/id/android/DIDWebUtils;->isInternalRequest(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 88
    new-instance v1, Lcom/disney/id/android/DIDSessionManager$1;

    invoke-direct {v1, p0, p1}, Lcom/disney/id/android/DIDSessionManager$1;-><init>(Lcom/disney/id/android/DIDSessionManager;Lcom/disney/id/android/DIDResponse;)V

    .line 171
    .local v1, "runCallbacks":Ljava/lang/Runnable;
    iget-object v2, p0, Lcom/disney/id/android/DIDSessionManager;->handler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 173
    .end local v1    # "runCallbacks":Ljava/lang/Runnable;
    :cond_0
    return-void
.end method

.method private static final sendResponse_aroundBody1$advice(Lcom/disney/id/android/DIDSessionManager;Lcom/disney/id/android/DIDResponse;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSessionManager;
    .param p1, "response"    # Lcom/disney/id/android/DIDResponse;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/DIDSessionManager;->sendResponse_aroundBody0(Lcom/disney/id/android/DIDSessionManager;Lcom/disney/id/android/DIDResponse;Lorg/aspectj/lang/JoinPoint;)V

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
.method final addCallback(Lcom/disney/id/android/DIDSessionDelegate;)V
    .locals 2
    .param p1, "callback"    # Lcom/disney/id/android/DIDSessionDelegate;

    .prologue
    .line 52
    iget-object v1, p0, Lcom/disney/id/android/DIDSessionManager;->callbacks:Ljava/util/List;

    monitor-enter v1

    .line 53
    if-eqz p1, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager;->callbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 54
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager;->callbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    :cond_0
    monitor-exit v1

    .line 57
    return-void

    .line 56
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method final removeCallback(Lcom/disney/id/android/DIDSessionDelegate;)V
    .locals 2
    .param p1, "callback"    # Lcom/disney/id/android/DIDSessionDelegate;

    .prologue
    .line 65
    iget-object v1, p0, Lcom/disney/id/android/DIDSessionManager;->callbacks:Ljava/util/List;

    monitor-enter v1

    .line 66
    :try_start_0
    iget-object v0, p0, Lcom/disney/id/android/DIDSessionManager;->callbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 67
    monitor-exit v1

    .line 68
    return-void

    .line 67
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public sendResponse(Lcom/disney/id/android/DIDResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/disney/id/android/DIDResponse;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSessionManager;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/DIDSessionManager;->sendResponse_aroundBody1$advice(Lcom/disney/id/android/DIDSessionManager;Lcom/disney/id/android/DIDResponse;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method
