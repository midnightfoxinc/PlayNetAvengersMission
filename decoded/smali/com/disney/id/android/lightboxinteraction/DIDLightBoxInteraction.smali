.class public Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;
.super Ljava/lang/Object;
.source "DIDLightBoxInteraction.java"

# interfaces
.implements Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionStatus;
.implements Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;
.implements Lcom/disney/id/android/lightboxinteraction/DIDWebView$Coordination;


# static fields
.field public static final DID_NATIVE_TO_WEB:Ljava/lang/String; = "didNativeToWeb"

.field public static final DID_WEB_TO_NATIVE:Ljava/lang/String; = "didWebToNative"

.field private static final LIGHTBOX_RELOAD_TIME_THRESHOLD:J

.field private static final TAG:Ljava/lang/String;

.field private static final VOLLEY_WEB_VIEW_TAG:Ljava/lang/String; = "WEB_VIEW"

.field private static final ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;


# instance fields
.field private bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

.field private contextMonitor:Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;

.field private dateWebViewLastLoaded:Ljava/lang/Long;

.field private existingHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mCallback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

.field private mRequest:Lcom/disney/id/android/DIDRequest;

.field private mResponse:Lcom/disney/id/android/DIDResponse;

.field private volatile madeRequest:Z

.field private webView:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

.field private webViewLoadRequests:Lcom/disney/id/android/volley/RequestQueue;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->ajc$preClinit()V

    .line 31
    const-class v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->TAG:Ljava/lang/String;

    .line 36
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0xf

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->LIGHTBOX_RELOAD_TIME_THRESHOLD:J

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDNullWebViewBridgeOwner;

    invoke-direct {v0}, Lcom/disney/id/android/lightboxinteraction/DIDNullWebViewBridgeOwner;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mCallback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->existingHeaders:Ljava/util/Map;

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->madeRequest:Z

    .line 58
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->contextMonitor:Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;

    .line 59
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebCacheManager;->setCache(Landroid/content/Context;)V

    .line 61
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->contextMonitor:Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->getCurrentContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;-><init>(Landroid/content/Context;Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;)V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    .line 62
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->contextMonitor:Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->getCurrentContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;-><init>(Landroid/content/Context;Lcom/disney/id/android/lightboxinteraction/DIDWebView$Coordination;)V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->webView:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    .line 64
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->webView:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->setWebCommunication(Lcom/disney/id/android/lightboxinteraction/DIDWebCommunication;)V

    .line 65
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->webView:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    const-string v2, "didWebToNative"

    invoke-virtual {v0, v1, v2}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->addJavascriptInterface(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;)V

    .line 67
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->contextMonitor:Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->getCurrentContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;)Lcom/disney/id/android/volley/RequestQueue;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->webViewLoadRequests:Lcom/disney/id/android/volley/RequestQueue;

    .line 68
    return-void
.end method

.method static synthetic access$002(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;
    .param p1, "x1"    # Ljava/lang/Long;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->dateWebViewLastLoaded:Ljava/lang/Long;

    return-object p1
.end method

.method static synthetic access$102(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;Ljava/util/Map;)Ljava/util/Map;
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;
    .param p1, "x1"    # Ljava/util/Map;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->existingHeaders:Ljava/util/Map;

    return-object p1
.end method

.method static synthetic access$200(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->loadLightBoxPage(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;)Lcom/disney/id/android/lightboxinteraction/DIDWebView;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->webView:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    return-object v0
.end method

.method static synthetic access$400()Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;)Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->contextMonitor:Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;

    return-object v0
.end method

.method private static ajc$preClinit()V
    .locals 9

    .prologue
    .line 1
    new-instance v0, Lorg/aspectj/runtime/reflect/Factory;

    const-string v1, "DIDLightBoxInteraction.java"

    const-class v2, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-direct {v0, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    const-string v8, "method-execution"

    const-string v1, "0"

    const-string v2, "handleRequest"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxInteraction"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xdd

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "handleNativeSynchronization"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxInteraction"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x177

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "prepareToDisplayNextPage"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxInteraction"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x186

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

    return-void
.end method

.method private getLightBoxUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 211
    const-string v0, "PRELOAD_INFO"

    const-string v1, "getLightBoxUrl() called"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getLBBaseUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->contextMonitor:Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->getCurrentContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/disney/id/android/external/DIDExternalUtils;->getSupportedExternalsQuery(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->contextMonitor:Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->getCurrentContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/disney/id/android/DIDStateManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDStateManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDStateManager;->getCurrentStateQueryParam()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getTimeElapsedSinceLastWebViewLoad()J
    .locals 6

    .prologue
    .line 161
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v4, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->dateWebViewLastLoaded:Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    sub-long v0, v2, v4

    .line 162
    .local v0, "offset":J
    const-string v2, "PRELOAD_INFO"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Time since last web view load: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-wide/16 v4, 0x3e8

    div-long v4, v0, v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " seconds"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    return-wide v0
.end method

.method private static final handleNativeSynchronization_aroundBody2(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    .prologue
    .line 375
    const-string v0, "PRELOAD_INFO"

    const-string v1, "handleNativeSynchronization() called."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 376
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->sync()V

    .line 377
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->madeRequest:Z

    .line 378
    return-void
.end method

.method private static final handleNativeSynchronization_aroundBody3$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->handleNativeSynchronization_aroundBody2(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final handleRequest_aroundBody0(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;Lorg/aspectj/lang/JoinPoint;)V
    .locals 3
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    .prologue
    .line 221
    const-string v0, "PRELOAD_INFO"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DIDLightBoxInteraction.handleRequest() called for request "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v2}, Lcom/disney/id/android/DIDRequest;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 262
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Invalid request"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 266
    :goto_0
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->isHandlingSocialInteraction()Z

    move-result v0

    if-nez v0, :cond_0

    .line 267
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->madeRequest:Z

    .line 269
    :cond_0
    return-void

    .line 224
    :sswitch_0
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    sget-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->LOGIN:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v2}, Lcom/disney/id/android/DIDRequest;->getRequestData()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->showPage(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;Ljava/lang/String;)V

    goto :goto_0

    .line 227
    :sswitch_1
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    sget-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->CREATE_PROFILE:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v2}, Lcom/disney/id/android/DIDRequest;->getRequestData()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->showPage(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;Ljava/lang/String;)V

    goto :goto_0

    .line 230
    :sswitch_2
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    sget-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->UPDATE_PROFILE:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v2}, Lcom/disney/id/android/DIDRequest;->getRequestData()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->showPage(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;Ljava/lang/String;)V

    goto :goto_0

    .line 233
    :sswitch_3
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    sget-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->FORGOT_USERNAME:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->showPage(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;)V

    goto :goto_0

    .line 236
    :sswitch_4
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    sget-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->FORGOT_PASSWORD:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->showPage(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;)V

    goto :goto_0

    .line 239
    :sswitch_5
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    sget-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->UPDATE_DISPLAYNAME:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v2}, Lcom/disney/id/android/DIDRequest;->getRequestData()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->showPage(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;Ljava/lang/String;)V

    goto :goto_0

    .line 242
    :sswitch_6
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    sget-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->SOCIAL_REGISTRATION:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v2}, Lcom/disney/id/android/DIDRequest;->getRequestData()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->showPage(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;Ljava/lang/String;)V

    goto :goto_0

    .line 246
    :sswitch_7
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    sget-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->SOCIAL_LOGIN_EXCEPTION_HANDLER:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v2}, Lcom/disney/id/android/DIDRequest;->getRequestData()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->showPage(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;Ljava/lang/String;)V

    goto :goto_0

    .line 249
    :sswitch_8
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    sget-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->REAUTH:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v2}, Lcom/disney/id/android/DIDRequest;->getRequestData()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->showPage(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;Ljava/lang/String;)V

    goto :goto_0

    .line 252
    :sswitch_9
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    sget-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->PPU:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v2}, Lcom/disney/id/android/DIDRequest;->getRequestData()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->showPage(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 255
    :sswitch_a
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    sget-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->NEWSLETTERS:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v2}, Lcom/disney/id/android/DIDRequest;->getRequestData()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->showPage(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 258
    :sswitch_b
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    sget-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->REQUEST_ACTIVITY:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v2}, Lcom/disney/id/android/DIDRequest;->getRequestData()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->showPage(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 222
    nop

    :sswitch_data_0
    .sparse-switch
        0x100 -> :sswitch_0
        0x101 -> :sswitch_8
        0x102 -> :sswitch_2
        0x103 -> :sswitch_1
        0x104 -> :sswitch_3
        0x105 -> :sswitch_4
        0x106 -> :sswitch_5
        0x107 -> :sswitch_a
        0x108 -> :sswitch_6
        0x109 -> :sswitch_b
        0x204 -> :sswitch_9
        0x300 -> :sswitch_7
        0x301 -> :sswitch_7
    .end sparse-switch
.end method

.method private static final handleRequest_aroundBody1$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->handleRequest_aroundBody0(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;Lorg/aspectj/lang/JoinPoint;)V

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

.method private isLightBoxReloadQueryRequired()Z
    .locals 6

    .prologue
    const/4 v0, 0x1

    .line 148
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->dateWebViewLastLoaded:Ljava/lang/Long;

    if-nez v1, :cond_1

    .line 156
    :cond_0
    :goto_0
    return v0

    .line 152
    :cond_1
    invoke-direct {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->getTimeElapsedSinceLastWebViewLoad()J

    move-result-wide v2

    sget-wide v4, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->LIGHTBOX_RELOAD_TIME_THRESHOLD:J

    cmp-long v1, v2, v4

    if-gez v1, :cond_0

    .line 156
    invoke-virtual {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->isWebViewLoading()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->isReady()Z

    move-result v1

    if-eqz v1, :cond_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private loadLightBoxPage(Ljava/lang/String;)V
    .locals 2
    .param p1, "pageData"    # Ljava/lang/String;

    .prologue
    .line 198
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->webView:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->stopLoading()V

    .line 199
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->resetBridge()V

    .line 200
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->dateWebViewLastLoaded:Ljava/lang/Long;

    .line 201
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->webView:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    invoke-direct {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->getLightBoxUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->loadPageFromExistingData(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    return-void
.end method

.method private static final prepareToDisplayNextPage_aroundBody4(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    .prologue
    .line 390
    const-string v0, "PRELOAD_INFO"

    const-string v1, "prepareToDisplayNextPage() called."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 391
    invoke-virtual {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->isLightBoxBridgeReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 392
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->madeRequest:Z

    .line 393
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    sget-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->READY:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->showPage(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;)V

    .line 396
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->prepareToDisplayNextPage()V

    .line 397
    return-void
.end method

.method private static final prepareToDisplayNextPage_aroundBody5$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->prepareToDisplayNextPage_aroundBody4(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;Lorg/aspectj/lang/JoinPoint;)V

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

.method private requestLightBoxPageData()V
    .locals 5

    .prologue
    .line 168
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->webViewLoadRequests:Lcom/disney/id/android/volley/RequestQueue;

    const-string v2, "WEB_VIEW"

    invoke-virtual {v1, v2}, Lcom/disney/id/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 170
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadRequest;

    invoke-direct {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->getLightBoxUrl()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->existingHeaders:Ljava/util/Map;

    new-instance v3, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction$1;

    invoke-direct {v3, p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction$1;-><init>(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;)V

    new-instance v4, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction$2;

    invoke-direct {v4, p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction$2;-><init>(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;)V

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadRequest;-><init>(Ljava/lang/String;Ljava/util/Map;Lcom/disney/id/android/volley/Response$Listener;Lcom/disney/id/android/volley/Response$ErrorListener;)V

    .line 192
    .local v0, "webViewLoadRequest":Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadRequest;
    const-string v1, "WEB_VIEW"

    invoke-virtual {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewLoadRequest;->setTag(Ljava/lang/Object;)Lcom/disney/id/android/volley/Request;

    .line 194
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->webViewLoadRequests:Lcom/disney/id/android/volley/RequestQueue;

    invoke-virtual {v1, v0}, Lcom/disney/id/android/volley/RequestQueue;->add(Lcom/disney/id/android/volley/Request;)Lcom/disney/id/android/volley/Request;

    .line 195
    return-void
.end method


# virtual methods
.method public bridgeReady()V
    .locals 1

    .prologue
    .line 273
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->contextMonitor:Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->allowContextSwitch()V

    .line 274
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mCallback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    invoke-interface {v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;->onReady()V

    .line 276
    invoke-virtual {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->hasMadeRequest()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->isHandlingSocialInteraction()Z

    move-result v0

    if-nez v0, :cond_0

    .line 277
    invoke-virtual {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->prepareToDisplayNextPage()V

    .line 279
    :cond_0
    return-void
.end method

.method cancelRequest()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 381
    const-string v0, "PRELOAD_INFO"

    const-string v1, "cancelRequest() called."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 382
    new-instance v0, Lcom/disney/id/android/DIDResponse;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-direct {v0, v2, v1}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;)V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mResponse:Lcom/disney/id/android/DIDResponse;

    .line 383
    iput-boolean v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->madeRequest:Z

    .line 384
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->contextMonitor:Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->getCurrentContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDSessionManager;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mResponse:Lcom/disney/id/android/DIDResponse;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDSessionManager;->sendResponse(Lcom/disney/id/android/DIDResponse;)V

    .line 385
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mCallback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mResponse:Lcom/disney/id/android/DIDResponse;

    invoke-interface {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;->onFinish(Lcom/disney/id/android/DIDResponse;)V

    .line 386
    return-void
.end method

.method cleanUp()V
    .locals 2

    .prologue
    .line 449
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->webViewLoadRequests:Lcom/disney/id/android/volley/RequestQueue;

    const-string v1, "WEB_VIEW"

    invoke-virtual {v0, v1}, Lcom/disney/id/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 450
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->webViewLoadRequests:Lcom/disney/id/android/volley/RequestQueue;

    invoke-virtual {v0}, Lcom/disney/id/android/volley/RequestQueue;->stop()V

    .line 451
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->setWebCommunication(Lcom/disney/id/android/lightboxinteraction/DIDWebCommunication;)V

    .line 452
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->webView:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    const-string v1, "didWebToNative"

    invoke-virtual {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->cleanUp(Ljava/lang/String;)V

    .line 453
    return-void
.end method

.method public close()V
    .locals 2

    .prologue
    .line 310
    const-string v0, "PRELOAD_INFO"

    const-string v1, "close() called"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 311
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "close() called."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 312
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mCallback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mResponse:Lcom/disney/id/android/DIDResponse;

    invoke-interface {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;->onFinish(Lcom/disney/id/android/DIDResponse;)V

    .line 313
    return-void
.end method

.method public createSuccess()V
    .locals 3

    .prologue
    .line 334
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "createSuccess() called."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 335
    new-instance v0, Lcom/disney/id/android/DIDResponse;

    const/16 v1, 0x10

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-direct {v0, v1, v2}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;)V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mResponse:Lcom/disney/id/android/DIDResponse;

    .line 336
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mCallback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mResponse:Lcom/disney/id/android/DIDResponse;

    invoke-interface {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;->onResponse(Lcom/disney/id/android/DIDResponse;)V

    .line 337
    return-void
.end method

.method public externalLogin(Ljava/lang/String;)V
    .locals 2
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 348
    const-string v0, "PRELOAD_INFO"

    const-string v1, "externalLogin() called."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 349
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "externalLogin() called."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 351
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->madeRequest:Z

    .line 352
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mCallback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v1}, Lcom/disney/id/android/DIDRequest;->getRequestData()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;->externalLogin(Ljava/lang/String;Ljava/lang/String;)V

    .line 353
    return-void
.end method

.method getRequest()Lcom/disney/id/android/DIDRequest;
    .locals 1

    .prologue
    .line 409
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    return-object v0
.end method

.method public getWebView()Landroid/webkit/WebView;
    .locals 1

    .prologue
    .line 427
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->webView:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    return-object v0
.end method

.method public handleLogout()V
    .locals 3

    .prologue
    .line 282
    const-string v0, "PRELOAD_INFO"

    const-string v1, "handleLogout() called."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->sync()V

    .line 284
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->madeRequest:Z

    .line 286
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    if-nez v0, :cond_0

    .line 287
    new-instance v0, Lcom/disney/id/android/DIDRequest;

    const/16 v1, 0x200

    invoke-direct {v0, v1}, Lcom/disney/id/android/DIDRequest;-><init>(I)V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    .line 290
    :cond_0
    new-instance v0, Lcom/disney/id/android/DIDResponse;

    const/16 v1, 0x22

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-direct {v0, v1, v2}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;)V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mResponse:Lcom/disney/id/android/DIDResponse;

    .line 291
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mCallback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mResponse:Lcom/disney/id/android/DIDResponse;

    invoke-interface {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;->onResponse(Lcom/disney/id/android/DIDResponse;)V

    .line 292
    return-void
.end method

.method public handleNativeSynchronization()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->handleNativeSynchronization_aroundBody3$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method handleRequest()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->handleRequest_aroundBody1$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public handleSocialSynchronization()V
    .locals 1

    .prologue
    .line 369
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->handleSocialSynchronization()V

    .line 370
    invoke-virtual {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->handleNativeSynchronization()V

    .line 371
    return-void
.end method

.method hasMadeRequest()Z
    .locals 1

    .prologue
    .line 436
    iget-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->madeRequest:Z

    return v0
.end method

.method public isHandlingSocialInteraction()Z
    .locals 1

    .prologue
    .line 440
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->isHandlingSocialInteraction()Z

    move-result v0

    return v0
.end method

.method public isLightBoxBridgeReady()Z
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->isReady()Z

    move-result v0

    return v0
.end method

.method public isLoadingPage()Z
    .locals 1

    .prologue
    .line 445
    iget-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->madeRequest:Z

    return v0
.end method

.method isWebViewLoading()Z
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->webView:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->isLoading()Z

    move-result v0

    return v0
.end method

.method public loginSuccess()V
    .locals 3

    .prologue
    .line 317
    const-string v1, "PRELOAD_INFO"

    const-string v2, "loginSuccess() called"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 318
    sget-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->TAG:Ljava/lang/String;

    invoke-static {v1}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "loginSuccess() called."

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->contextMonitor:Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->getCurrentContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->sharedInstance(Landroid/content/Context;)Lcom/disney/id/android/InternalImprovedDIDSessionManager;

    move-result-object v0

    .line 321
    .local v0, "sessionManager":Lcom/disney/id/android/InternalImprovedDIDSessionManager;
    invoke-virtual {v0}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->finalizeLogin()V

    .line 322
    invoke-virtual {v0}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->fireOneShotLoginSuccessAction()V

    .line 323
    return-void
.end method

.method public onPageFinished(Ljava/lang/String;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 98
    invoke-virtual {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->isLightBoxBridgeReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 99
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->webView:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    invoke-virtual {v0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->attemptUrlStore(Ljava/lang/String;)V

    .line 102
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->bridgeInject()V

    .line 103
    return-void
.end method

.method public onPageStarted(Ljava/lang/String;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 91
    const-string v0, "PRELOAD_INFO"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPageStarted() "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPageStarted() "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mCallback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    invoke-interface {v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;->onPageStarted()V

    .line 94
    return-void
.end method

.method public onReceivedError(I)V
    .locals 3
    .param p1, "errorCode"    # I

    .prologue
    .line 107
    new-instance v0, Lcom/disney/id/android/DIDResponse;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    new-instance v2, Lcom/disney/id/android/DIDException;

    invoke-direct {v2, p1}, Lcom/disney/id/android/DIDException;-><init>(I)V

    invoke-direct {v0, p1, v1, v2}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;Lcom/disney/id/android/DIDException;)V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mResponse:Lcom/disney/id/android/DIDResponse;

    .line 108
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mCallback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mResponse:Lcom/disney/id/android/DIDResponse;

    invoke-interface {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;->onResponse(Lcom/disney/id/android/DIDResponse;)V

    .line 109
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mCallback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mResponse:Lcom/disney/id/android/DIDResponse;

    invoke-interface {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;->onFinish(Lcom/disney/id/android/DIDResponse;)V

    .line 110
    return-void
.end method

.method onResume(Lcom/disney/id/android/DIDRequest;)V
    .locals 2
    .param p1, "pendingRequest"    # Lcom/disney/id/android/DIDRequest;

    .prologue
    .line 119
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    .line 121
    invoke-virtual {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->isWebViewLoading()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 122
    const-string v0, "PRELOAD_INFO"

    const-string v1, "web view is loading, so we can\'t handle requests and we shouldn\'t attempt to load LB again"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    :cond_0
    :goto_0
    return-void

    .line 126
    :cond_1
    invoke-virtual {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->isLightBoxBridgeReady()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->isLightBoxReloadQueryRequired()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 127
    :cond_2
    const-string v0, "PRELOAD_INFO"

    const-string v1, "Bad bridge connection or stale data, need to reload LB"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    invoke-direct {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->requestLightBoxPageData()V

    goto :goto_0

    .line 129
    :cond_3
    invoke-virtual {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->hasMadeRequest()Z

    move-result v0

    if-nez v0, :cond_0

    .line 130
    invoke-virtual {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->handleRequest()V

    goto :goto_0
.end method

.method public optInSuccess(Ljava/lang/String;)V
    .locals 3
    .param p1, "newsletters"    # Ljava/lang/String;

    .prologue
    .line 363
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "optInSuccess() called."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 364
    new-instance v0, Lcom/disney/id/android/DIDResponse;

    const/16 v1, 0x15

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-direct {v0, v1, p1, v2}, Lcom/disney/id/android/DIDResponse;-><init>(ILjava/lang/String;Lcom/disney/id/android/DIDRequest;)V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mResponse:Lcom/disney/id/android/DIDResponse;

    .line 365
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mCallback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mResponse:Lcom/disney/id/android/DIDResponse;

    invoke-interface {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;->onResponse(Lcom/disney/id/android/DIDResponse;)V

    .line 366
    return-void
.end method

.method public prepareToDisplayNextPage()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->prepareToDisplayNextPage_aroundBody5$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public reauthSuccess()V
    .locals 3

    .prologue
    .line 327
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "reauthSuccess() called."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    new-instance v0, Lcom/disney/id/android/DIDResponse;

    const/16 v1, 0x16

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-direct {v0, v1, v2}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;)V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mResponse:Lcom/disney/id/android/DIDResponse;

    .line 329
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mCallback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mResponse:Lcom/disney/id/android/DIDResponse;

    invoke-interface {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;->onResponse(Lcom/disney/id/android/DIDResponse;)V

    .line 330
    return-void
.end method

.method requestClose()V
    .locals 1

    .prologue
    .line 400
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->bridgeToLightBox:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->requestClose()V

    .line 401
    return-void
.end method

.method public sendMetrics(Ljava/lang/String;)V
    .locals 3
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 357
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sendMetrics() called.: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 358
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->contextMonitor:Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->getCurrentContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDStateManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDStateManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/id/android/DIDStateManager;->trackDispatchEvent(Ljava/lang/String;)V

    .line 359
    return-void
.end method

.method setBridgeOwner(Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;)V
    .locals 2
    .param p1, "callback"    # Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    .prologue
    .line 113
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mCallback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    .line 115
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->webView:Lcom/disney/id/android/lightboxinteraction/DIDWebView;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mCallback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebView;->updateCallback(Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;)V

    .line 116
    return-void
.end method

.method public setCloseBehavior(ZZ)V
    .locals 3
    .param p1, "showCloseButton"    # Z
    .param p2, "preventCloseEvent"    # Z

    .prologue
    .line 303
    const-string v0, "PRELOAD_INFO"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "showClose(showCloseButton="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", preventCloseEvent="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") called"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "showClose("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") called."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 305
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mCallback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    invoke-interface {v0, p1, p2}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;->showClose(ZZ)V

    .line 306
    return-void
.end method

.method setResponse(Lcom/disney/id/android/DIDResponse;)V
    .locals 0
    .param p1, "response"    # Lcom/disney/id/android/DIDResponse;

    .prologue
    .line 418
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mResponse:Lcom/disney/id/android/DIDResponse;

    .line 419
    return-void
.end method

.method public showLoader(Z)V
    .locals 3
    .param p1, "shouldShow"    # Z

    .prologue
    .line 296
    const-string v0, "PRELOAD_INFO"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "showLoader("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") called"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 297
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "showLoader("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") called."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mCallback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    invoke-interface {v0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;->showLoader(Z)V

    .line 299
    return-void
.end method

.method triggerWebViewLoad()V
    .locals 2

    .prologue
    .line 71
    const-string v0, "PRELOAD_INFO"

    const-string v1, "triggerWebViewLoad() called"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->contextMonitor:Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->getCurrentContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDWebUtils;->isConnected(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 73
    const-string v0, "PRELOAD_INFO"

    const-string v1, "We didn\'t have an internet connection when we created DIDLightBoxInteraction, so we shouldn\'t try to load LightBox."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    :cond_0
    :goto_0
    return-void

    .line 77
    :cond_1
    invoke-direct {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->isLightBoxReloadQueryRequired()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 78
    const-string v0, "PRELOAD_INFO"

    const-string v1, "The page might be out of date, we need to request information from LightBox"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->contextMonitor:Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->preventContextSwitch()V

    .line 80
    invoke-direct {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->requestLightBoxPageData()V

    goto :goto_0
.end method

.method updateContext(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 85
    const-string v0, "PRELOAD_INFO"

    const-string v1, "context was updated"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->contextMonitor:Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;

    invoke-virtual {v0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDContextMonitor;->updateContext(Landroid/content/Context;)V

    .line 87
    return-void
.end method

.method public updateSuccess(Ljava/lang/String;)V
    .locals 3
    .param p1, "delta"    # Ljava/lang/String;

    .prologue
    .line 341
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "updateSuccess() called."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 342
    new-instance v0, Lcom/disney/id/android/DIDResponse;

    const/16 v1, 0x11

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-direct {v0, v1, p1, v2}, Lcom/disney/id/android/DIDResponse;-><init>(ILjava/lang/String;Lcom/disney/id/android/DIDRequest;)V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mResponse:Lcom/disney/id/android/DIDResponse;

    .line 343
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mCallback:Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->mResponse:Lcom/disney/id/android/DIDResponse;

    invoke-interface {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;->onResponse(Lcom/disney/id/android/DIDResponse;)V

    .line 344
    return-void
.end method
