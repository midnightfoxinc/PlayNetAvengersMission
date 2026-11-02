.class public Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
.super Landroid/support/v4/app/FragmentActivity;
.source "DIDLightBoxActivity.java"

# interfaces
.implements Lcom/disney/id/android/DIDReachability$DIDReachabilityListener;
.implements Lcom/disney/id/android/DIDActivityLaunchBroadcast$DIDActivityLaunchListener;
.implements Lcom/disney/id/android/log/DIDEventParams;


# static fields
.field public static final REQUEST_EXTRA_NAME:Ljava/lang/String; = "com.disney.id.android.REQUEST"

.field private static final TAG:Ljava/lang/String;

.field private static final ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_10:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_11:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_12:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_13:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_14:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_3:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_4:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_5:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_6:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_7:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_8:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_9:Lorg/aspectj/lang/JoinPoint$StaticPart;


# instance fields
.field private lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

.field private mContext:Landroid/content/Context;

.field private final mDIDActivityLaunch:Lcom/disney/id/android/DIDActivityLaunchBroadcast;

.field private mDIDReachability:Lcom/disney/id/android/DIDReachability;

.field private mRequest:Lcom/disney/id/android/DIDRequest;

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

.field private mShowCloseButton:Z

.field private mStopCloseEvent:Z

.field private progressTracking:Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

.field private webViewGroup:Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;

.field private final webViewStateHandler:Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$preClinit()V

    .line 55
    const-class v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 49
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    .line 60
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;

    invoke-direct {v0, p0}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->webViewStateHandler:Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;

    .line 66
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mRequestQueue:Ljava/util/Queue;

    .line 69
    new-instance v0, Lcom/disney/id/android/DIDReachability;

    invoke-direct {v0}, Lcom/disney/id/android/DIDReachability;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mDIDReachability:Lcom/disney/id/android/DIDReachability;

    .line 70
    new-instance v0, Lcom/disney/id/android/DIDActivityLaunchBroadcast;

    invoke-direct {v0}, Lcom/disney/id/android/DIDActivityLaunchBroadcast;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mDIDActivityLaunch:Lcom/disney/id/android/DIDActivityLaunchBroadcast;

    .line 72
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mShowCloseButton:Z

    .line 73
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mStopCloseEvent:Z

    return-void
.end method

.method static synthetic access$000(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    return-object v0
.end method

.method static synthetic access$100(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->webViewStateHandler:Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;

    return-object v0
.end method

.method static synthetic access$200(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->removeAnyActiveNetworkMonitoring()V

    return-void
.end method

.method static synthetic access$300(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Lcom/disney/id/android/DIDRequest;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    return-object v0
.end method

.method static synthetic access$302(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lcom/disney/id/android/DIDRequest;)Lcom/disney/id/android/DIDRequest;
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
    .param p1, "x1"    # Lcom/disney/id/android/DIDRequest;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    return-object p1
.end method

.method static synthetic access$400(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$500()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->webViewGroup:Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;

    return-object v0
.end method

.method static synthetic access$702(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 49
    iput-boolean p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mShowCloseButton:Z

    return p1
.end method

.method static synthetic access$802(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 49
    iput-boolean p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mStopCloseEvent:Z

    return p1
.end method

.method static synthetic access$900(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Landroid/os/Message;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->constructSetNavigationUIMessage()Landroid/os/Message;

    move-result-object v0

    return-object v0
.end method

.method private static ajc$preClinit()V
    .locals 9

    .prologue
    .line 1
    new-instance v0, Lorg/aspectj/runtime/reflect/Factory;

    const-string v1, "DIDLightBoxActivity.java"

    const-class v2, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-direct {v0, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "onNetworkReachabilityChange"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity"

    const-string v4, "boolean"

    const-string v5, "connected"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x4e

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "onActivityLaunched"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x60

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "4"

    const-string v2, "onDestroy"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x10a

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_10:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "finish"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x114

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_11:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "4"

    const-string v2, "onActivityResult"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity"

    const-string v4, "int:int:android.content.Intent"

    const-string v5, "requestCode:resultCode:intent"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x125

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_12:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "2"

    const-string v2, "finishWithResult"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity"

    const-string v4, "com.disney.id.android.DIDResponse"

    const-string v5, "response"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x130

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_13:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "2"

    const-string v2, "createBridgeOwner"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "com.disney.id.android.lightboxinteraction.DIDWebViewBridgeOwner"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x138

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_14:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "4"

    const-string v2, "onCreate"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity"

    const-string v4, "android.os.Bundle"

    const-string v5, "savedInstanceState"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x71

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "2"

    const-string v2, "onAttachToLightBoxInteraction"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x9b

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_3:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "4"

    const-string v2, "onNewIntent"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity"

    const-string v4, "android.content.Intent"

    const-string v5, "intent"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xaa

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_4:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "4"

    const-string v2, "onResume"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xc3

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_5:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "2"

    const-string v2, "onResumeWebView"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xcc

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_6:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "onWindowFocusChanged"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity"

    const-string v4, "boolean"

    const-string v5, "hasFocus"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xd7

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_7:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "2"

    const-string v2, "constructSetNavigationUIMessage"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "android.os.Message"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xdf

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_8:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "4"

    const-string v2, "onPause"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x102

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_9:Lorg/aspectj/lang/JoinPoint$StaticPart;

    return-void
.end method

.method private configureLayout()V
    .locals 5

    .prologue
    .line 134
    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->isStatusBarHidden()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 135
    sget v2, Lcom/disney/id/android/R$style;->DisneyIDTheme_NoStatusBar:I

    invoke-virtual {p0, v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->setTheme(I)V

    .line 137
    :cond_0
    sget v2, Lcom/disney/id/android/R$layout;->did_activity_layout:I

    invoke-virtual {p0, v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->setContentView(I)V

    .line 139
    sget v2, Lcom/disney/id/android/R$id;->did_background:I

    invoke-virtual {p0, v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 142
    .local v1, "imageView":Landroid/widget/ImageView;
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/disney/id/android/R$drawable;->did_background:I

    invoke-static {v3, v4}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 144
    .local v0, "background":Landroid/graphics/drawable/BitmapDrawable;
    sget-object v2, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/BitmapDrawable;->setTileModeX(Landroid/graphics/Shader$TileMode;)V

    .line 145
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-lt v2, v3, :cond_1

    .line 146
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 151
    :goto_0
    return-void

    .line 149
    :cond_1
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0
.end method

.method private constructSetNavigationUIMessage()Landroid/os/Message;
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_8:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->constructSetNavigationUIMessage_aroundBody17$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Message;

    return-object v0
.end method

.method private static final constructSetNavigationUIMessage_aroundBody16(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;)Landroid/os/Message;
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    .prologue
    .line 223
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 224
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0x15

    iput v1, v0, Landroid/os/Message;->what:I

    .line 225
    iget-boolean v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mShowCloseButton:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 227
    return-object v0
.end method

.method private static final constructSetNavigationUIMessage_aroundBody17$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->constructSetNavigationUIMessage_aroundBody16(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;)Landroid/os/Message;

    move-result-object v3

    .line 43
    .local v3, "result":Landroid/os/Message;
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

.method private createBridgeOwner()Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;
    .locals 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_14:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->createBridgeOwner_aroundBody29$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    return-object v0
.end method

.method private static final createBridgeOwner_aroundBody28(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;)Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;
    .locals 1
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    .prologue
    .line 312
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;

    invoke-direct {v0, p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;-><init>(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)V

    return-object v0
.end method

.method private static final createBridgeOwner_aroundBody29$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->createBridgeOwner_aroundBody28(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;)Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    move-result-object v3

    .line 43
    .local v3, "result":Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;
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

.method private finishWithResult(Lcom/disney/id/android/DIDResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/disney/id/android/DIDResponse;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_13:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->finishWithResult_aroundBody27$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lcom/disney/id/android/DIDResponse;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method private static final finishWithResult_aroundBody26(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lcom/disney/id/android/DIDResponse;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
    .param p1, "response"    # Lcom/disney/id/android/DIDResponse;

    .prologue
    .line 304
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDSessionManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/id/android/DIDSessionManager;->sendResponse(Lcom/disney/id/android/DIDResponse;)V

    .line 305
    invoke-virtual {p1}, Lcom/disney/id/android/DIDResponse;->getResponseCode()I

    move-result v0

    invoke-virtual {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->setResult(ILandroid/content/Intent;)V

    .line 306
    invoke-virtual {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->finish()V

    .line 307
    return-void
.end method

.method private static final finishWithResult_aroundBody27$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lcom/disney/id/android/DIDResponse;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->finishWithResult_aroundBody26(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lcom/disney/id/android/DIDResponse;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final finish_aroundBody22(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;)V
    .locals 3
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    .prologue
    .line 276
    const-string v1, "PRELOAD_INFO"

    const-string v2, "DIDLightBoxActivity.finish() called"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 277
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mRequestQueue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 278
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    .line 288
    :goto_0
    return-void

    .line 280
    :cond_0
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 281
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0x13

    iput v1, v0, Landroid/os/Message;->what:I

    .line 282
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->webViewStateHandler:Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;

    invoke-virtual {v1, v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->sendMessage(Landroid/os/Message;)Z

    .line 284
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mRequestQueue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/disney/id/android/DIDRequest;

    iput-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    .line 286
    invoke-direct {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onResumeWebView()V

    goto :goto_0
.end method

.method private static final finish_aroundBody23$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->finish_aroundBody22(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final onActivityLaunched_aroundBody2(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    .prologue
    .line 96
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/disney/id/android/DIDUtils;->isContextAlive(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 97
    const-string v0, "PRELOAD_INFO"

    const-string v1, "DIDLightBoxActivity.onActivityLaunched() called"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onActivityLaunched() called."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v0

    const/16 v1, 0x102

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v0

    const/16 v1, 0x106

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v0}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v0

    const/16 v1, 0x204

    if-eq v0, v1, :cond_0

    .line 103
    const-string v0, "PRELOAD_INFO"

    const-string v1, "onActivityLaunched() called, but we have to cancel the current request"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->cancelRequest()V

    .line 107
    :cond_0
    return-void
.end method

.method private static final onActivityLaunched_aroundBody3$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onActivityLaunched_aroundBody2(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final onActivityResult_aroundBody24(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;IILandroid/content/Intent;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 293
    const-string v0, "PRELOAD_INFO"

    const-string v1, "Calling DIDLightBoxActivity.onActivityResult()"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/FragmentActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 296
    invoke-static {p1}, Lcom/disney/id/android/external/DIDExternalFactory;->isExternal(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 297
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->prepareToDisplayNextPage()V

    .line 299
    :cond_0
    new-instance v0, Lcom/disney/id/android/DIDResponse;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-direct {v0, p2, v1}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;)V

    invoke-direct {p0, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->finishWithResult(Lcom/disney/id/android/DIDResponse;)V

    .line 300
    return-void
.end method

.method private static final onActivityResult_aroundBody25$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;IILandroid/content/Intent;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;
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
    invoke-static {p0, p1, p2, p3, p6}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onActivityResult_aroundBody24(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;IILandroid/content/Intent;Lorg/aspectj/lang/JoinPoint;)V

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

.method private onAttachToLightBoxInteraction()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_3:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onAttachToLightBoxInteraction_aroundBody7$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method private static final onAttachToLightBoxInteraction_aroundBody6(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    .prologue
    .line 155
    const-string v0, "PRELOAD_INFO"

    const-string v1, "onAttachToLightBoxInteraction() called"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->isLightBoxBridgeReady()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 165
    :goto_0
    return-void

    .line 160
    :cond_0
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->getInstance()Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->getCachedLightBoxInteraction(Landroid/content/Context;)Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    .line 161
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->webViewStateHandler:Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->setLightBoxInteraction(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;)V

    .line 163
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-direct {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->createBridgeOwner()Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->setBridgeOwner(Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;)V

    .line 164
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->webViewGroup:Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->push(Landroid/view/View;)V

    goto :goto_0
.end method

.method private static final onAttachToLightBoxInteraction_aroundBody7$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onAttachToLightBoxInteraction_aroundBody6(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final onCreate_aroundBody4(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Landroid/os/Bundle;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 113
    const-string v0, "PRELOAD_INFO"

    const-string v1, "DIDLightBoxActivity.onCreate() called"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 115
    invoke-direct {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->configureLayout()V

    .line 117
    iput-object p0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mContext:Landroid/content/Context;

    .line 119
    invoke-virtual {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "com.disney.id.android.REQUEST"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/disney/id/android/DIDRequest;

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    .line 121
    new-instance v0, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    invoke-direct {v0, p0}, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;-><init>(Landroid/support/v4/app/FragmentActivity;)V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->progressTracking:Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    .line 122
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->webViewStateHandler:Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->progressTracking:Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->setProgressTracking(Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;)V

    .line 124
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mDIDReachability:Lcom/disney/id/android/DIDReachability;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1, p0}, Lcom/disney/id/android/DIDReachability;->registerContext(Landroid/content/Context;Lcom/disney/id/android/DIDReachability$DIDReachabilityListener;)V

    .line 125
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mDIDActivityLaunch:Lcom/disney/id/android/DIDActivityLaunchBroadcast;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1, p0}, Lcom/disney/id/android/DIDActivityLaunchBroadcast;->registerContext(Landroid/content/Context;Lcom/disney/id/android/DIDActivityLaunchBroadcast$DIDActivityLaunchListener;)V

    .line 127
    new-instance v1, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;

    sget v0, Lcom/disney/id/android/R$id;->did_webview_group:I

    invoke-virtual {p0, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;-><init>(Landroid/widget/LinearLayout;)V

    iput-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->webViewGroup:Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;

    .line 128
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->webViewStateHandler:Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->webViewGroup:Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->setWebViewGroup(Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;)V

    .line 129
    invoke-direct {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onAttachToLightBoxInteraction()V

    .line 130
    return-void
.end method

.method private static final onCreate_aroundBody5$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Landroid/os/Bundle;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onCreate_aroundBody4(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Landroid/os/Bundle;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final onDestroy_aroundBody20(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    .prologue
    .line 266
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onDestroy()V

    .line 267
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onDestroy()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    invoke-direct {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->removeAnyActiveNetworkMonitoring()V

    .line 269
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mDIDActivityLaunch:Lcom/disney/id/android/DIDActivityLaunchBroadcast;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDActivityLaunchBroadcast;->unregisterContext(Landroid/content/Context;)V

    .line 270
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->webViewGroup:Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->clearViews()V

    .line 271
    return-void
.end method

.method private static final onDestroy_aroundBody21$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onDestroy_aroundBody20(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final onNetworkReachabilityChange_aroundBody0(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;ZLorg/aspectj/lang/JoinPoint;)V
    .locals 4
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
    .param p1, "connected"    # Z

    .prologue
    const/4 v3, 0x7

    .line 78
    if-nez p1, :cond_0

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/disney/id/android/DIDUtils;->isContextAlive(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->progressTracking:Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDProgressDisplay;->isProgressShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 82
    sget-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->TAG:Ljava/lang/String;

    invoke-static {v1}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "No network connection available."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    new-instance v0, Lcom/disney/id/android/DIDResponse;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    new-instance v2, Lcom/disney/id/android/DIDException;

    invoke-direct {v2, v3}, Lcom/disney/id/android/DIDException;-><init>(I)V

    invoke-direct {v0, v3, v1, v2}, Lcom/disney/id/android/DIDResponse;-><init>(ILcom/disney/id/android/DIDRequest;Lcom/disney/id/android/DIDException;)V

    .line 86
    .local v0, "response":Lcom/disney/id/android/DIDResponse;
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-virtual {v1, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->setResponse(Lcom/disney/id/android/DIDResponse;)V

    .line 87
    invoke-direct {p0, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->finishWithResult(Lcom/disney/id/android/DIDResponse;)V

    .line 91
    .end local v0    # "response":Lcom/disney/id/android/DIDResponse;
    :goto_0
    return-void

    .line 89
    :cond_0
    const-string v1, "PRELOAD_INFO"

    const-string v2, "DIDLightBoxActivity reports that everything\'s fine on the connection front"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static final onNetworkReachabilityChange_aroundBody1$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;ZLorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
    .param p1, "connected"    # Z
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onNetworkReachabilityChange_aroundBody0(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;ZLorg/aspectj/lang/JoinPoint;)V

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

.method private static final onNewIntent_aroundBody8(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Landroid/content/Intent;Lorg/aspectj/lang/JoinPoint;)V
    .locals 6
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 170
    const-string v4, "PRELOAD_INFO"

    const-string v5, "DIDLightBoxActivity.onNewIntent() called"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 172
    iget-object v4, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/disney/id/android/DIDUtils;->isContextAlive(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 173
    const-string v4, "com.disney.id.android.REQUEST"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/disney/id/android/DIDRequest;

    .line 174
    .local v2, "newRequest":Lcom/disney/id/android/DIDRequest;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v4

    iget-object v5, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v5}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v5

    if-eq v4, v5, :cond_0

    .line 175
    sget-object v4, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->TAG:Ljava/lang/String;

    invoke-static {v4}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Lcom/disney/id/android/DIDRequest;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    iget-object v4, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mRequestQueue:Ljava/util/Queue;

    invoke-interface {v4}, Ljava/util/Queue;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 177
    iget-object v4, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mRequestQueue:Ljava/util/Queue;

    invoke-interface {v4, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 190
    .end local v2    # "newRequest":Lcom/disney/id/android/DIDRequest;
    :cond_0
    :goto_0
    return-void

    .line 179
    .restart local v2    # "newRequest":Lcom/disney/id/android/DIDRequest;
    :cond_1
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 180
    .local v1, "newQueue":Ljava/util/Queue;
    iget-object v4, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mRequestQueue:Ljava/util/Queue;

    invoke-interface {v4}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/disney/id/android/DIDRequest;

    .line 181
    .local v3, "req":Lcom/disney/id/android/DIDRequest;
    invoke-virtual {v3}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v4

    invoke-virtual {v2}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v5

    if-eq v4, v5, :cond_2

    .line 182
    invoke-interface {v1, v3}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 184
    :cond_2
    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 186
    .end local v3    # "req":Lcom/disney/id/android/DIDRequest;
    :cond_3
    iput-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mRequestQueue:Ljava/util/Queue;

    goto :goto_0
.end method

.method private static final onNewIntent_aroundBody9$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Landroid/content/Intent;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
    .param p1, "intent"    # Landroid/content/Intent;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onNewIntent_aroundBody8(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Landroid/content/Intent;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final onPause_aroundBody18(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    .prologue
    .line 258
    const-string v0, "PRELOAD_INFO"

    const-string v1, "DIDLightBoxActivity.onPause() called"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onPause()V

    .line 260
    invoke-direct {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->removeAnyActiveNetworkMonitoring()V

    .line 261
    return-void
.end method

.method private static final onPause_aroundBody19$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onPause_aroundBody18(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;)V

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

.method private onResumeWebView()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_6:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onResumeWebView_aroundBody13$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method private static final onResumeWebView_aroundBody12(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    .prologue
    .line 204
    const-string v0, "PRELOAD_INFO"

    const-string v1, "onResumeWebView() called"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    if-nez v0, :cond_0

    .line 210
    :goto_0
    return-void

    .line 209
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->onResume(Lcom/disney/id/android/DIDRequest;)V

    goto :goto_0
.end method

.method private static final onResumeWebView_aroundBody13$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onResumeWebView_aroundBody12(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final onResume_aroundBody10(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;)V
    .locals 3
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    .prologue
    .line 195
    const-string v0, "PRELOAD_INFO"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DIDLightBoxActivity.onResume() called with request "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    invoke-super {p0}, Landroid/support/v4/app/FragmentActivity;->onResume()V

    .line 197
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onResume() "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mRequest:Lcom/disney/id/android/DIDRequest;

    invoke-virtual {v2}, Lcom/disney/id/android/DIDRequest;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    invoke-direct {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onResumeWebView()V

    .line 200
    return-void
.end method

.method private static final onResume_aroundBody11$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onResume_aroundBody10(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final onWindowFocusChanged_aroundBody14(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;ZLorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
    .param p1, "hasFocus"    # Z

    .prologue
    .line 215
    invoke-super {p0, p1}, Landroid/support/v4/app/FragmentActivity;->onWindowFocusChanged(Z)V

    .line 216
    if-eqz p1, :cond_0

    .line 217
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->webViewStateHandler:Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;

    invoke-direct {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->constructSetNavigationUIMessage()Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->sendMessage(Landroid/os/Message;)Z

    .line 219
    :cond_0
    return-void
.end method

.method private static final onWindowFocusChanged_aroundBody15$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;ZLorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;
    .param p1, "hasFocus"    # Z
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onWindowFocusChanged_aroundBody14(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;ZLorg/aspectj/lang/JoinPoint;)V

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

.method private removeAnyActiveNetworkMonitoring()V
    .locals 2

    .prologue
    .line 493
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mDIDReachability:Lcom/disney/id/android/DIDReachability;

    if-eqz v0, :cond_0

    .line 494
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mDIDReachability:Lcom/disney/id/android/DIDReachability;

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDReachability;->unregisterContext(Landroid/content/Context;)V

    .line 495
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mDIDReachability:Lcom/disney/id/android/DIDReachability;

    .line 497
    :cond_0
    return-void
.end method


# virtual methods
.method public finish()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_11:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->finish_aroundBody23$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public onActivityLaunched()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onActivityLaunched_aroundBody3$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 7
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_12:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Lorg/aspectj/runtime/internal/Conversions;->intObject(I)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p2}, Lorg/aspectj/runtime/internal/Conversions;->intObject(I)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object p3, v1, v2

    invoke-static {v0, p0, p0, v1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v4

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v5

    move-object v6, v4

    check-cast v6, Lorg/aspectj/lang/ProceedingJoinPoint;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v6}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onActivityResult_aroundBody25$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;IILandroid/content/Intent;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi",
            "deprecation"
        }
    .end annotation

    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onCreate_aroundBody5$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Landroid/os/Bundle;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method protected onDestroy()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_10:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onDestroy_aroundBody21$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v1, 0x1

    .line 232
    const/4 v2, 0x4

    if-ne p1, v2, :cond_3

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v2

    if-nez v2, :cond_3

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    if-eqz v2, :cond_3

    .line 234
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->webViewGroup:Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;

    invoke-virtual {v2}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->count()I

    move-result v2

    if-le v2, v1, :cond_0

    .line 235
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 236
    .local v0, "msg":Landroid/os/Message;
    const/16 v2, 0x12

    iput v2, v0, Landroid/os/Message;->what:I

    .line 237
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->webViewStateHandler:Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;

    invoke-virtual {v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->sendMessage(Landroid/os/Message;)Z

    .line 252
    .end local v0    # "msg":Landroid/os/Message;
    :goto_0
    return v1

    .line 239
    :cond_0
    iget-boolean v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->mStopCloseEvent:Z

    if-eqz v2, :cond_1

    .line 240
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-virtual {v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->requestClose()V

    goto :goto_0

    .line 242
    :cond_1
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-virtual {v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->getWebView()Landroid/webkit/WebView;

    move-result-object v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-virtual {v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->getWebView()Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 243
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-virtual {v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->getWebView()Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/webkit/WebView;->goBack()V

    goto :goto_0

    .line 246
    :cond_2
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-virtual {v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->cancelRequest()V

    .line 247
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->lightBoxInteraction:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    invoke-virtual {v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->prepareToDisplayNextPage()V

    goto :goto_0

    .line 252
    :cond_3
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/FragmentActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_0
.end method

.method public onNetworkReachabilityChange(Z)V
    .locals 3
    .param p1, "connected"    # Z
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {p1}, Lorg/aspectj/runtime/internal/Conversions;->booleanObject(Z)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, p0, p0, v1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onNetworkReachabilityChange_aroundBody1$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;ZLorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_4:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onNewIntent_aroundBody9$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Landroid/content/Intent;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method protected onPause()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_9:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onPause_aroundBody19$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method protected onResume()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_5:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onResume_aroundBody11$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 3
    .param p1, "hasFocus"    # Z
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->ajc$tjp_7:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {p1}, Lorg/aspectj/runtime/internal/Conversions;->booleanObject(Z)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, p0, p0, v1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->onWindowFocusChanged_aroundBody15$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;ZLorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method
