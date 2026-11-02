.class Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;
.super Landroid/webkit/WebViewClient;
.source "DIDLightBoxActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->onCreateWindow(Landroid/webkit/WebView;ZZLandroid/os/Message;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field private static final ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;


# instance fields
.field final synthetic this$1:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .prologue
    .line 1
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;->ajc$preClinit()V

    return-void
.end method

.method constructor <init>(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;)V
    .locals 0

    .prologue
    .line 375
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;->this$1:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method

.method private static ajc$preClinit()V
    .locals 9

    .prologue
    .line 1
    new-instance v0, Lorg/aspectj/runtime/reflect/Factory;

    const-string v1, "DIDLightBoxActivity.java"

    const-class v2, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;

    invoke-direct {v0, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "shouldOverrideUrlLoading"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity$1$1"

    const-string v4, "android.webkit.WebView:java.lang.String"

    const-string v5, "view:url"

    const-string v6, ""

    const-string v7, "boolean"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x17c

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "onPageFinished"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity$1$1"

    const-string v4, "android.webkit.WebView:java.lang.String"

    const-string v5, "view:url"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x18a

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    return-void
.end method

.method private static final onPageFinished_aroundBody2(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;Landroid/webkit/WebView;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 394
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 395
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0x8

    iput v1, v0, Landroid/os/Message;->what:I

    .line 396
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;->this$1:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;

    iget-object v1, v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$100(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->sendMessage(Landroid/os/Message;)Z

    .line 397
    return-void
.end method

.method private static final onPageFinished_aroundBody3$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;Landroid/webkit/WebView;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
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
    invoke-static {p0, p1, p2, p5}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;->onPageFinished_aroundBody2(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;Landroid/webkit/WebView;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final shouldOverrideUrlLoading_aroundBody0(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;Landroid/webkit/WebView;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)Z
    .locals 4
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 380
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$500()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "shouldOverrideUrlLoading() "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 382
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;->this$1:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;

    iget-object v1, v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$400(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p2}, Lcom/disney/id/android/DIDWebUtils;->externalTargetUrl(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 383
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 384
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0x12

    iput v1, v0, Landroid/os/Message;->what:I

    .line 385
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;->this$1:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;

    iget-object v1, v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$100(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->sendMessage(Landroid/os/Message;)Z

    .line 386
    const/4 v1, 0x1

    .line 388
    .end local v0    # "msg":Landroid/os/Message;
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static final shouldOverrideUrlLoading_aroundBody1$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;Landroid/webkit/WebView;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
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
    invoke-static {p0, p1, p2, p5}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;->shouldOverrideUrlLoading_aroundBody0(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;Landroid/webkit/WebView;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)Z

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


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 6
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1, p2}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v3

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v4

    move-object v5, v3

    check-cast v5, Lorg/aspectj/lang/ProceedingJoinPoint;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-static/range {v0 .. v5}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;->onPageFinished_aroundBody3$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;Landroid/webkit/WebView;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 6
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1, p2}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v3

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v4

    move-object v5, v3

    check-cast v5, Lorg/aspectj/lang/ProceedingJoinPoint;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-static/range {v0 .. v5}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;->shouldOverrideUrlLoading_aroundBody1$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;Landroid/webkit/WebView;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lorg/aspectj/runtime/internal/Conversions;->booleanValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
