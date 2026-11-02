.class public Lcom/disney/id/android/DIDSession;
.super Lcom/disney/id/android/DIDSessionBase;
.source "DIDSession.java"

# interfaces
.implements Lcom/disney/id/android/constants/DIDRequestCode;
.implements Lcom/disney/id/android/constants/DIDErrorCode;
.implements Lcom/disney/id/android/constants/DIDResponseCode;
.implements Lcom/disney/id/android/log/DIDEventParams;
.implements Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/id/android/DIDSession$RequestFailure;,
        Lcom/disney/id/android/DIDSession$RequestSuccess;,
        Lcom/disney/id/android/DIDSession$DIDSilentServiceConnection;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static final ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_10:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_11:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_12:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_13:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_14:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_15:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_3:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_4:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_5:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_6:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_7:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_8:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_9:Lorg/aspectj/lang/JoinPoint$StaticPart;


# instance fields
.field private applicationVisibilityListener:Lcom/disney/id/android/DIDForeground$Listener;

.field private forceTokenRefreshFailureAction:Lcom/disney/id/android/DIDSession$RequestFailure;

.field private forceTokenRefreshSuccessAction:Lcom/disney/id/android/DIDSession$RequestSuccess;

.field private successfulLoginAction:Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/disney/id/android/IDIDSessionManager$RequestSuccess",
            "<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    invoke-static {}, Lcom/disney/id/android/DIDSession;->ajc$preClinit()V

    .line 25
    const-class v0, Lcom/disney/id/android/DIDSession;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDSession;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 63
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/disney/id/android/DIDSession;-><init>(Landroid/content/Context;Lcom/disney/id/android/DIDSessionDelegate;)V

    .line 64
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/disney/id/android/DIDSessionDelegate;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "callback"    # Lcom/disney/id/android/DIDSessionDelegate;

    .prologue
    .line 67
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/disney/id/android/DIDSession;-><init>(Landroid/content/Context;Lcom/disney/id/android/DIDSessionDelegate;Lcom/disney/id/android/DIDSession$DIDSilentServiceConnection;)V

    .line 68
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/disney/id/android/DIDSessionDelegate;Lcom/disney/id/android/DIDSession$DIDSilentServiceConnection;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "callback"    # Lcom/disney/id/android/DIDSessionDelegate;
    .param p3, "serviceConnection"    # Lcom/disney/id/android/DIDSession$DIDSilentServiceConnection;

    .prologue
    .line 72
    invoke-direct {p0, p2, p3, p1}, Lcom/disney/id/android/DIDSessionBase;-><init>(Lcom/disney/id/android/DIDSessionDelegate;Lcom/disney/id/android/DIDSession$DIDSilentServiceConnection;Landroid/content/Context;)V

    .line 27
    new-instance v1, Lcom/disney/id/android/DIDSession$1;

    invoke-direct {v1, p0}, Lcom/disney/id/android/DIDSession$1;-><init>(Lcom/disney/id/android/DIDSession;)V

    iput-object v1, p0, Lcom/disney/id/android/DIDSession;->successfulLoginAction:Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;

    .line 74
    invoke-static {p1}, Lcom/disney/id/android/DIDSessionConfig;->loadConfig(Landroid/content/Context;)V

    .line 75
    invoke-static {p1}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->sharedInstance(Landroid/content/Context;)Lcom/disney/id/android/InternalImprovedDIDSessionManager;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->setDelegate(Lcom/disney/id/android/IDIDSessionManager$DIDSessionManagerDelegate;)V

    .line 77
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->getInstance()Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->initializeCache(Landroid/content/Context;)V

    .line 78
    invoke-static {p1}, Lcom/disney/id/android/DIDForeground;->init(Landroid/content/Context;)Lcom/disney/id/android/DIDForeground;

    move-result-object v0

    .line 79
    .local v0, "appLifecycleDetection":Lcom/disney/id/android/DIDForeground;
    invoke-virtual {v0}, Lcom/disney/id/android/DIDForeground;->isForeground()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 80
    const-string v1, "PRELOAD_INFO"

    const-string v2, "We know that the app is already in the foreground, attempt to refresh cache"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->getInstance()Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->refreshCache()V

    .line 84
    :cond_0
    new-instance v1, Lcom/disney/id/android/DIDSession$2;

    invoke-direct {v1, p0}, Lcom/disney/id/android/DIDSession$2;-><init>(Lcom/disney/id/android/DIDSession;)V

    iput-object v1, p0, Lcom/disney/id/android/DIDSession;->applicationVisibilityListener:Lcom/disney/id/android/DIDForeground$Listener;

    .line 96
    iget-object v1, p0, Lcom/disney/id/android/DIDSession;->applicationVisibilityListener:Lcom/disney/id/android/DIDForeground$Listener;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDForeground;->addListener(Lcom/disney/id/android/DIDForeground$Listener;)V

    .line 97
    return-void
.end method

.method private static ajc$preClinit()V
    .locals 9

    .prologue
    .line 1
    new-instance v0, Lorg/aspectj/runtime/reflect/Factory;

    const-string v1, "DIDSession.java"

    const-class v2, Lcom/disney/id/android/DIDSession;

    invoke-direct {v0, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "start"

    const-string v3, "com.disney.id.android.DIDSession"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x88

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDSession;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "stop"

    const-string v3, "com.disney.id.android.DIDSession"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xa1

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDSession;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "launchDisplayName"

    const-string v3, "com.disney.id.android.DIDSession"

    const-string v4, "com.disney.id.android.DIDOptionalConfigs"

    const-string v5, "options"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x1a1

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDSession;->ajc$tjp_10:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "logout"

    const-string v3, "com.disney.id.android.DIDSession"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x1d7

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDSession;->ajc$tjp_11:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "refreshGuestData"

    const-string v3, "com.disney.id.android.DIDSession"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x228

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDSession;->ajc$tjp_12:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "forceTokenRefresh"

    const-string v3, "com.disney.id.android.DIDSession"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x230

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDSession;->ajc$tjp_13:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "migrateFromBlueCookie"

    const-string v3, "com.disney.id.android.DIDSession"

    const-string v4, "java.lang.String"

    const-string v5, "blueCookie"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x240

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDSession;->ajc$tjp_14:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "launchNewsletters"

    const-string v3, "com.disney.id.android.DIDSession"

    const-string v4, "com.disney.id.android.DIDOptionalConfigs:java.lang.String"

    const-string v5, "options:promotionId"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x263

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDSession;->ajc$tjp_15:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "launchLogin"

    const-string v3, "com.disney.id.android.DIDSession"

    const-string v4, "com.disney.id.android.DIDOptionalConfigs"

    const-string v5, "options"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xbc

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDSession;->ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "launchReauth"

    const-string v3, "com.disney.id.android.DIDSession"

    const-string v4, "com.disney.id.android.DIDOptionalConfigs"

    const-string v5, "options"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xd6

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDSession;->ajc$tjp_3:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "launchSocialRegistration"

    const-string v3, "com.disney.id.android.DIDSession"

    const-string v4, "com.disney.id.android.DIDOptionalConfigs"

    const-string v5, "options"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xf4

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDSession;->ajc$tjp_4:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "launchFacebookLogin"

    const-string v3, "com.disney.id.android.DIDSession"

    const-string v4, "com.disney.id.android.DIDOptionalConfigs"

    const-string v5, "options"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x10b

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDSession;->ajc$tjp_5:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "launchRegistration"

    const-string v3, "com.disney.id.android.DIDSession"

    const-string v4, "com.disney.id.android.DIDOptionalConfigs"

    const-string v5, "options"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x144

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDSession;->ajc$tjp_6:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "launchProfile"

    const-string v3, "com.disney.id.android.DIDSession"

    const-string v4, "com.disney.id.android.DIDOptionalConfigs"

    const-string v5, "options"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x15c

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDSession;->ajc$tjp_7:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "launchRecoverUsername"

    const-string v3, "com.disney.id.android.DIDSession"

    const-string v4, "com.disney.id.android.DIDOptionalConfigs"

    const-string v5, "options"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x173

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDSession;->ajc$tjp_8:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "launchResetPassword"

    const-string v3, "com.disney.id.android.DIDSession"

    const-string v4, "com.disney.id.android.DIDOptionalConfigs"

    const-string v5, "options"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x18a

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDSession;->ajc$tjp_9:Lorg/aspectj/lang/JoinPoint$StaticPart;

    return-void
.end method

.method private static final forceTokenRefresh_aroundBody26(Lcom/disney/id/android/DIDSession;Lorg/aspectj/lang/JoinPoint;)V
    .locals 1
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;

    .prologue
    .line 560
    const/16 v0, 0x202

    invoke-virtual {p0, v0}, Lcom/disney/id/android/DIDSession;->startRequest(I)V

    .line 561
    return-void
.end method

.method private static final forceTokenRefresh_aroundBody27$advice(Lcom/disney/id/android/DIDSession;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/DIDSession;->forceTokenRefresh_aroundBody26(Lcom/disney/id/android/DIDSession;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final launchDisplayName_aroundBody20(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;

    .prologue
    .line 417
    const/16 v0, 0x106

    invoke-virtual {p0, p1}, Lcom/disney/id/android/DIDSession;->getJSON(Lcom/disney/id/android/DIDOptionalConfigs;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/disney/id/android/DIDSession;->startRequest(ILorg/json/JSONObject;)V

    .line 418
    return-void
.end method

.method private static final launchDisplayName_aroundBody21$advice(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/DIDSession;->launchDisplayName_aroundBody20(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final launchFacebookLogin_aroundBody10(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;)V
    .locals 4
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;

    .prologue
    .line 267
    invoke-virtual {p0}, Lcom/disney/id/android/DIDSession;->logout()V

    .line 268
    iget-object v1, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->sharedInstance(Landroid/content/Context;)Lcom/disney/id/android/InternalImprovedDIDSessionManager;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/id/android/DIDSession;->successfulLoginAction:Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;

    invoke-virtual {v1, v2}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->setOneShotLoginSuccessAction(Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;)V

    .line 269
    invoke-virtual {p0, p1}, Lcom/disney/id/android/DIDSession;->getJSON(Lcom/disney/id/android/DIDOptionalConfigs;)Lorg/json/JSONObject;

    move-result-object v0

    .line 270
    .local v0, "jo":Lorg/json/JSONObject;
    sget-object v1, Lcom/disney/id/android/DIDSession;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "launchFacebookLogin: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    const/16 v1, 0x300

    invoke-virtual {p0, v1, v0}, Lcom/disney/id/android/DIDSession;->startRequest(ILorg/json/JSONObject;)V

    .line 272
    return-void
.end method

.method private static final launchFacebookLogin_aroundBody11$advice(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/DIDSession;->launchFacebookLogin_aroundBody10(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final launchLogin_aroundBody4(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;

    .prologue
    .line 188
    invoke-virtual {p0}, Lcom/disney/id/android/DIDSession;->logout()V

    .line 189
    iget-object v0, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->sharedInstance(Landroid/content/Context;)Lcom/disney/id/android/InternalImprovedDIDSessionManager;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/DIDSession;->successfulLoginAction:Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->setOneShotLoginSuccessAction(Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;)V

    .line 190
    const/16 v0, 0x100

    invoke-virtual {p0, p1}, Lcom/disney/id/android/DIDSession;->getJSON(Lcom/disney/id/android/DIDOptionalConfigs;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/disney/id/android/DIDSession;->startRequest(ILorg/json/JSONObject;)V

    .line 191
    return-void
.end method

.method private static final launchLogin_aroundBody5$advice(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/DIDSession;->launchLogin_aroundBody4(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final launchNewsletters_aroundBody30(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;
    .param p2, "promotionId"    # Ljava/lang/String;

    .prologue
    .line 611
    invoke-static {p2}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 621
    :goto_0
    return-void

    .line 614
    :cond_0
    invoke-virtual {p0, p1}, Lcom/disney/id/android/DIDSession;->getJSON(Lcom/disney/id/android/DIDOptionalConfigs;)Lorg/json/JSONObject;

    move-result-object v0

    .line 616
    .local v0, "json":Lorg/json/JSONObject;
    :try_start_0
    const-string v1, "promotionId"

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 620
    :goto_1
    const/16 v1, 0x107

    invoke-virtual {p0, v1, v0}, Lcom/disney/id/android/DIDSession;->startRequest(ILorg/json/JSONObject;)V

    goto :goto_0

    .line 617
    :catch_0
    move-exception v1

    goto :goto_1
.end method

.method private static final launchNewsletters_aroundBody31$advice(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;
    .param p2, "promotionId"    # Ljava/lang/String;
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
    invoke-static {p0, p1, p2, p5}, Lcom/disney/id/android/DIDSession;->launchNewsletters_aroundBody30(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final launchProfile_aroundBody14(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;

    .prologue
    .line 348
    const/16 v0, 0x102

    invoke-virtual {p0, p1}, Lcom/disney/id/android/DIDSession;->getJSON(Lcom/disney/id/android/DIDOptionalConfigs;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/disney/id/android/DIDSession;->startRequest(ILorg/json/JSONObject;)V

    .line 349
    return-void
.end method

.method private static final launchProfile_aroundBody15$advice(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/DIDSession;->launchProfile_aroundBody14(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final launchReauth_aroundBody6(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;

    .prologue
    .line 214
    invoke-virtual {p0}, Lcom/disney/id/android/DIDSession;->isAuthenticatedViaSocial()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 215
    iget-object v0, p0, Lcom/disney/id/android/DIDSession;->mCallback:Lcom/disney/id/android/DIDSessionDelegate;

    invoke-interface {v0}, Lcom/disney/id/android/DIDSessionDelegate;->onReauth()V

    .line 220
    :goto_0
    return-void

    .line 219
    :cond_0
    const/16 v0, 0x101

    invoke-virtual {p0, p1}, Lcom/disney/id/android/DIDSession;->getJSON(Lcom/disney/id/android/DIDOptionalConfigs;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/disney/id/android/DIDSession;->startRequest(ILorg/json/JSONObject;)V

    goto :goto_0
.end method

.method private static final launchReauth_aroundBody7$advice(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/DIDSession;->launchReauth_aroundBody6(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final launchRecoverUsername_aroundBody16(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;

    .prologue
    .line 371
    const/16 v0, 0x104

    invoke-virtual {p0, p1}, Lcom/disney/id/android/DIDSession;->getJSON(Lcom/disney/id/android/DIDOptionalConfigs;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/disney/id/android/DIDSession;->startRequest(ILorg/json/JSONObject;)V

    .line 372
    return-void
.end method

.method private static final launchRecoverUsername_aroundBody17$advice(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/DIDSession;->launchRecoverUsername_aroundBody16(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final launchRegistration_aroundBody12(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;

    .prologue
    .line 324
    invoke-virtual {p0}, Lcom/disney/id/android/DIDSession;->logout()V

    .line 325
    const/16 v0, 0x103

    invoke-virtual {p0, p1}, Lcom/disney/id/android/DIDSession;->getJSON(Lcom/disney/id/android/DIDOptionalConfigs;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/disney/id/android/DIDSession;->startRequest(ILorg/json/JSONObject;)V

    .line 326
    return-void
.end method

.method private static final launchRegistration_aroundBody13$advice(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/DIDSession;->launchRegistration_aroundBody12(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final launchResetPassword_aroundBody18(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;

    .prologue
    .line 394
    const/16 v0, 0x105

    invoke-virtual {p0, p1}, Lcom/disney/id/android/DIDSession;->getJSON(Lcom/disney/id/android/DIDOptionalConfigs;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/disney/id/android/DIDSession;->startRequest(ILorg/json/JSONObject;)V

    .line 395
    return-void
.end method

.method private static final launchResetPassword_aroundBody19$advice(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/DIDSession;->launchResetPassword_aroundBody18(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final launchSocialRegistration_aroundBody8(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;

    .prologue
    .line 244
    invoke-virtual {p0}, Lcom/disney/id/android/DIDSession;->logout()V

    .line 245
    const/16 v0, 0x108

    invoke-virtual {p0, p1}, Lcom/disney/id/android/DIDSession;->getJSON(Lcom/disney/id/android/DIDOptionalConfigs;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/disney/id/android/DIDSession;->startRequest(ILorg/json/JSONObject;)V

    .line 246
    return-void
.end method

.method private static final launchSocialRegistration_aroundBody9$advice(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/DIDSession;->launchSocialRegistration_aroundBody8(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final logout_aroundBody22(Lcom/disney/id/android/DIDSession;Lorg/aspectj/lang/JoinPoint;)V
    .locals 3
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;

    .prologue
    const/4 v1, 0x0

    .line 471
    iput-object v1, p0, Lcom/disney/id/android/DIDSession;->forceTokenRefreshSuccessAction:Lcom/disney/id/android/DIDSession$RequestSuccess;

    .line 472
    iput-object v1, p0, Lcom/disney/id/android/DIDSession;->forceTokenRefreshFailureAction:Lcom/disney/id/android/DIDSession$RequestFailure;

    .line 473
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->hasToken()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 474
    iget-object v1, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->sharedInstance(Landroid/content/Context;)Lcom/disney/id/android/InternalImprovedDIDSessionManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->logout()V

    .line 475
    invoke-virtual {p0}, Lcom/disney/id/android/DIDSession;->isFacebookCapable()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 476
    invoke-static {}, Lcom/disney/id/android/external/DIDExternalFactory;->instance()Lcom/disney/id/android/external/DIDExternalFactory;

    move-result-object v1

    const/16 v2, 0x300

    invoke-virtual {v1, v2}, Lcom/disney/id/android/external/DIDExternalFactory;->createExternal(I)Lcom/disney/id/android/external/DIDExternal;

    move-result-object v0

    .line 477
    .local v0, "mDIDExternal":Lcom/disney/id/android/external/DIDExternal;
    if-eqz v0, :cond_0

    .line 478
    iget-object v1, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/external/DIDExternal;->setContext(Landroid/content/Context;)V

    .line 479
    invoke-virtual {v0}, Lcom/disney/id/android/external/DIDExternal;->logout()V

    .line 482
    .end local v0    # "mDIDExternal":Lcom/disney/id/android/external/DIDExternal;
    :cond_0
    invoke-virtual {p0}, Lcom/disney/id/android/DIDSession;->isGooglePlusCapable()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 483
    invoke-static {}, Lcom/disney/id/android/external/DIDExternalFactory;->instance()Lcom/disney/id/android/external/DIDExternalFactory;

    move-result-object v1

    const/16 v2, 0x301

    invoke-virtual {v1, v2}, Lcom/disney/id/android/external/DIDExternalFactory;->createExternal(I)Lcom/disney/id/android/external/DIDExternal;

    move-result-object v0

    .line 484
    .restart local v0    # "mDIDExternal":Lcom/disney/id/android/external/DIDExternal;
    if-eqz v0, :cond_1

    .line 485
    iget-object v1, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/external/DIDExternal;->setContext(Landroid/content/Context;)V

    .line 486
    invoke-virtual {v0}, Lcom/disney/id/android/external/DIDExternal;->logout()V

    .line 490
    .end local v0    # "mDIDExternal":Lcom/disney/id/android/external/DIDExternal;
    :cond_1
    iget-object v1, p0, Lcom/disney/id/android/DIDSession;->mCallback:Lcom/disney/id/android/DIDSessionDelegate;

    invoke-interface {v1}, Lcom/disney/id/android/DIDSessionDelegate;->onLogout()V

    .line 492
    :cond_2
    return-void
.end method

.method private static final logout_aroundBody23$advice(Lcom/disney/id/android/DIDSession;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/DIDSession;->logout_aroundBody22(Lcom/disney/id/android/DIDSession;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final migrateFromBlueCookie_aroundBody28(Lcom/disney/id/android/DIDSession;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "blueCookie"    # Ljava/lang/String;

    .prologue
    const/16 v1, 0x206

    .line 576
    new-instance v0, Lcom/disney/id/android/DIDRequest;

    invoke-direct {v0, v1, p1}, Lcom/disney/id/android/DIDRequest;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/disney/id/android/DIDSession;->isSilent(I)Z

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/disney/id/android/DIDSession;->startRequest(Lcom/disney/id/android/DIDRequest;Z)V

    .line 577
    return-void
.end method

.method private static final migrateFromBlueCookie_aroundBody29$advice(Lcom/disney/id/android/DIDSession;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
    .param p1, "blueCookie"    # Ljava/lang/String;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/DIDSession;->migrateFromBlueCookie_aroundBody28(Lcom/disney/id/android/DIDSession;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final refreshGuestData_aroundBody24(Lcom/disney/id/android/DIDSession;Lorg/aspectj/lang/JoinPoint;)V
    .locals 1
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;

    .prologue
    .line 552
    const/16 v0, 0x201

    invoke-virtual {p0, v0}, Lcom/disney/id/android/DIDSession;->startRequest(I)V

    .line 553
    return-void
.end method

.method private static final refreshGuestData_aroundBody25$advice(Lcom/disney/id/android/DIDSession;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/DIDSession;->refreshGuestData_aroundBody24(Lcom/disney/id/android/DIDSession;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final start_aroundBody0(Lcom/disney/id/android/DIDSession;Lorg/aspectj/lang/JoinPoint;)V
    .locals 5
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;

    .prologue
    const/4 v4, 0x1

    .line 136
    invoke-static {}, Lcom/disney/id/android/localization/DIDLocalizationManager;->getInstance()Lcom/disney/id/android/localization/DIDLocalizationManager;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/localization/DIDLocalizationManager;->initialize(Landroid/content/Context;)V

    .line 138
    :try_start_0
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/DIDSession;->mDIDLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    invoke-virtual {v1}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->getGuestData()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDGuest;->update(Lorg/json/JSONObject;)V

    .line 140
    iget-object v0, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->sharedInstance(Landroid/content/Context;)Lcom/disney/id/android/InternalImprovedDIDSessionManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->scheduleInitialRefreshForLoggedInGuest()V
    :try_end_0
    .catch Lcom/disney/id/android/DIDGuest$GuestException; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    :goto_0
    iget-boolean v0, p0, Lcom/disney/id/android/DIDSession;->mIsBound:Z

    if-nez v0, :cond_0

    .line 146
    iput-boolean v4, p0, Lcom/disney/id/android/DIDSession;->mIsBinding:Z

    .line 147
    iget-object v0, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    const-class v3, Lcom/disney/id/android/DIDService;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v2, p0, Lcom/disney/id/android/DIDSession;->myConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1, v2, v4}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 151
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/DIDSession;->mCallback:Lcom/disney/id/android/DIDSessionDelegate;

    if-eqz v0, :cond_1

    .line 152
    iget-object v0, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDSessionManager;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/DIDSession;->mCallback:Lcom/disney/id/android/DIDSessionDelegate;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDSessionManager;->addCallback(Lcom/disney/id/android/DIDSessionDelegate;)V

    .line 154
    :cond_1
    return-void

    .line 142
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private static final start_aroundBody1$advice(Lcom/disney/id/android/DIDSession;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/DIDSession;->start_aroundBody0(Lcom/disney/id/android/DIDSession;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final stop_aroundBody2(Lcom/disney/id/android/DIDSession;Lorg/aspectj/lang/JoinPoint;)V
    .locals 5
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;

    .prologue
    const/4 v4, 0x0

    .line 161
    iput-boolean v4, p0, Lcom/disney/id/android/DIDSession;->mIsBinding:Z

    .line 162
    iget-object v0, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/disney/id/android/DIDSession;->myConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 163
    iget-object v0, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    const-class v3, Lcom/disney/id/android/DIDService;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    .line 164
    iput-boolean v4, p0, Lcom/disney/id/android/DIDSession;->mIsBound:Z

    .line 166
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->getInstance()Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteractionLifecycle;->resetCache()V

    .line 167
    iget-object v0, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/disney/id/android/DIDForeground;->init(Landroid/content/Context;)Lcom/disney/id/android/DIDForeground;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/DIDSession;->applicationVisibilityListener:Lcom/disney/id/android/DIDForeground$Listener;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDForeground;->removeListener(Lcom/disney/id/android/DIDForeground$Listener;)V

    .line 168
    iget-object v0, p0, Lcom/disney/id/android/DIDSession;->mCallback:Lcom/disney/id/android/DIDSessionDelegate;

    if-eqz v0, :cond_0

    .line 169
    iget-object v0, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDSessionManager;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/DIDSession;->mCallback:Lcom/disney/id/android/DIDSessionDelegate;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/DIDSessionManager;->removeCallback(Lcom/disney/id/android/DIDSessionDelegate;)V

    .line 171
    :cond_0
    return-void
.end method

.method private static final stop_aroundBody3$advice(Lcom/disney/id/android/DIDSession;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDSession;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/DIDSession;->stop_aroundBody2(Lcom/disney/id/android/DIDSession;Lorg/aspectj/lang/JoinPoint;)V

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
.method public clearDefaultOptionalConfigs()V
    .locals 1

    .prologue
    .line 104
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/disney/id/android/DIDSession;->setDefaultOptionalConfigs(Lcom/disney/id/android/DIDOptionalConfigs;)V

    .line 105
    return-void
.end method

.method public forceTokenRefresh()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSession;->ajc$tjp_13:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/DIDSession;->forceTokenRefresh_aroundBody27$advice(Lcom/disney/id/android/DIDSession;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public forceTokenRefresh(Lcom/disney/id/android/DIDSession$RequestSuccess;Lcom/disney/id/android/DIDSession$RequestFailure;)V
    .locals 1
    .param p1, "forceTokenRefreshSuccessAction"    # Lcom/disney/id/android/DIDSession$RequestSuccess;
    .param p2, "forceTokenRefreshFailureAction"    # Lcom/disney/id/android/DIDSession$RequestFailure;

    .prologue
    .line 564
    iput-object p1, p0, Lcom/disney/id/android/DIDSession;->forceTokenRefreshSuccessAction:Lcom/disney/id/android/DIDSession$RequestSuccess;

    .line 565
    iput-object p2, p0, Lcom/disney/id/android/DIDSession;->forceTokenRefreshFailureAction:Lcom/disney/id/android/DIDSession$RequestFailure;

    .line 566
    iget-object v0, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->sharedInstance(Landroid/content/Context;)Lcom/disney/id/android/InternalImprovedDIDSessionManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->forceTokenRefresh()V

    .line 567
    return-void
.end method

.method public getActivityStatus(Ljava/lang/String;Lcom/disney/id/android/DIDSession$RequestSuccess;Lcom/disney/id/android/DIDSession$RequestFailure;)V
    .locals 3
    .param p1, "activityCode"    # Ljava/lang/String;
    .param p2, "successAction"    # Lcom/disney/id/android/DIDSession$RequestSuccess;
    .param p3, "failureAction"    # Lcom/disney/id/android/DIDSession$RequestFailure;

    .prologue
    .line 436
    iget-object v0, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->sharedInstance(Landroid/content/Context;)Lcom/disney/id/android/InternalImprovedDIDSessionManager;

    move-result-object v0

    new-instance v1, Lcom/disney/id/android/DIDSession$3;

    invoke-direct {v1, p0, p2}, Lcom/disney/id/android/DIDSession$3;-><init>(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDSession$RequestSuccess;)V

    new-instance v2, Lcom/disney/id/android/DIDSession$4;

    invoke-direct {v2, p0, p3}, Lcom/disney/id/android/DIDSession$4;-><init>(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDSession$RequestFailure;)V

    invoke-virtual {v0, p1, v1, v2}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->getActivityStatus(Ljava/lang/String;Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;Lcom/disney/id/android/IDIDSessionManager$RequestFailure;)V

    .line 453
    return-void
.end method

.method public getCanUseSite()Z
    .locals 1

    .prologue
    .line 516
    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getCanUseSite()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public getDoNotDisturb()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 528
    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getDoNotDisturb()Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public getGuestData()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 180
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method public getLowTrust()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 506
    :try_start_0
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/id/android/DIDGuest;->hasGuest()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/id/android/DIDToken;->getLowTrust()Z
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    if-nez v2, :cond_1

    .line 508
    :cond_0
    :goto_0
    return v1

    .line 506
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 507
    :catch_0
    move-exception v0

    .line 508
    .local v0, "ex":Ljava/lang/NullPointerException;
    goto :goto_0
.end method

.method public isFacebookCapable()Z
    .locals 3

    .prologue
    .line 111
    invoke-static {}, Lcom/disney/id/android/external/DIDExternalFactory;->instance()Lcom/disney/id/android/external/DIDExternalFactory;

    move-result-object v1

    const/16 v2, 0x300

    invoke-virtual {v1, v2}, Lcom/disney/id/android/external/DIDExternalFactory;->createExternal(I)Lcom/disney/id/android/external/DIDExternal;

    move-result-object v0

    .line 112
    .local v0, "mDIDExternal":Lcom/disney/id/android/external/DIDExternal;
    if-eqz v0, :cond_0

    .line 113
    iget-object v1, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/external/DIDExternal;->setContext(Landroid/content/Context;)V

    .line 114
    invoke-virtual {v0}, Lcom/disney/id/android/external/DIDExternal;->isAvailable()Z

    move-result v1

    .line 116
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isGooglePlusCapable()Z
    .locals 3

    .prologue
    .line 123
    invoke-static {}, Lcom/disney/id/android/external/DIDExternalFactory;->instance()Lcom/disney/id/android/external/DIDExternalFactory;

    move-result-object v1

    const/16 v2, 0x301

    invoke-virtual {v1, v2}, Lcom/disney/id/android/external/DIDExternalFactory;->createExternal(I)Lcom/disney/id/android/external/DIDExternal;

    move-result-object v0

    .line 124
    .local v0, "mDIDExternal":Lcom/disney/id/android/external/DIDExternal;
    if-eqz v0, :cond_0

    .line 125
    iget-object v1, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/external/DIDExternal;->setContext(Landroid/content/Context;)V

    .line 126
    invoke-virtual {v0}, Lcom/disney/id/android/external/DIDExternal;->isAvailable()Z

    move-result v1

    .line 128
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isLoggedIn()Z
    .locals 1

    .prologue
    .line 498
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/DIDGuest;->hasGuest()Z

    move-result v0

    return v0
.end method

.method public launchDisplayName()V
    .locals 1

    .prologue
    .line 424
    const/4 v0, 0x0

    check-cast v0, Lcom/disney/id/android/DIDOptionalConfigs;

    invoke-virtual {p0, v0}, Lcom/disney/id/android/DIDSession;->launchDisplayName(Lcom/disney/id/android/DIDOptionalConfigs;)V

    .line 425
    return-void
.end method

.method public launchDisplayName(Lcom/disney/id/android/DIDOptionalConfigs;)V
    .locals 3
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSession;->ajc$tjp_10:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/DIDSession;->launchDisplayName_aroundBody21$advice(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public launchDisplayName(Ljava/lang/String;)V
    .locals 0
    .param p1, "override"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 432
    invoke-virtual {p0}, Lcom/disney/id/android/DIDSession;->launchDisplayName()V

    .line 433
    return-void
.end method

.method public launchFacebookLogin()V
    .locals 1

    .prologue
    .line 278
    const/4 v0, 0x0

    check-cast v0, Lcom/disney/id/android/DIDOptionalConfigs;

    invoke-virtual {p0, v0}, Lcom/disney/id/android/DIDSession;->launchFacebookLogin(Lcom/disney/id/android/DIDOptionalConfigs;)V

    .line 279
    return-void
.end method

.method public launchFacebookLogin(Lcom/disney/id/android/DIDOptionalConfigs;)V
    .locals 3
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSession;->ajc$tjp_5:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/DIDSession;->launchFacebookLogin_aroundBody11$advice(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public launchFacebookLogin(Ljava/lang/String;)V
    .locals 0
    .param p1, "override"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 286
    invoke-virtual {p0}, Lcom/disney/id/android/DIDSession;->launchFacebookLogin()V

    .line 287
    return-void
.end method

.method public launchGooglePlusLogin()V
    .locals 1

    .prologue
    .line 306
    const/4 v0, 0x0

    check-cast v0, Lcom/disney/id/android/DIDOptionalConfigs;

    invoke-virtual {p0, v0}, Lcom/disney/id/android/DIDSession;->launchGooglePlusLogin(Lcom/disney/id/android/DIDOptionalConfigs;)V

    .line 307
    return-void
.end method

.method public launchGooglePlusLogin(Lcom/disney/id/android/DIDOptionalConfigs;)V
    .locals 5
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;

    .prologue
    const/16 v4, 0x301

    .line 295
    invoke-virtual {p0}, Lcom/disney/id/android/DIDSession;->logout()V

    .line 296
    invoke-virtual {p0, p1}, Lcom/disney/id/android/DIDSession;->getJSON(Lcom/disney/id/android/DIDOptionalConfigs;)Lorg/json/JSONObject;

    move-result-object v0

    .line 297
    .local v0, "jo":Lorg/json/JSONObject;
    sget-object v1, Lcom/disney/id/android/DIDSession;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "launchGooglePlusLogin: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    iget-object v1, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->sharedInstance(Landroid/content/Context;)Lcom/disney/id/android/InternalImprovedDIDSessionManager;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/id/android/DIDSession;->successfulLoginAction:Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;

    invoke-virtual {v1, v2}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->setOneShotLoginSuccessAction(Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;)V

    .line 299
    invoke-virtual {p0, v4}, Lcom/disney/id/android/DIDSession;->isSilent(I)Z

    move-result v1

    invoke-virtual {p0, v4, v0, v1}, Lcom/disney/id/android/DIDSession;->startRequest(ILorg/json/JSONObject;Z)V

    .line 300
    return-void
.end method

.method public launchGooglePlusLogin(Ljava/lang/String;)V
    .locals 0
    .param p1, "override"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 316
    invoke-virtual {p0}, Lcom/disney/id/android/DIDSession;->launchGooglePlusLogin()V

    .line 317
    return-void
.end method

.method public launchLogin()V
    .locals 1

    .prologue
    .line 197
    const/4 v0, 0x0

    check-cast v0, Lcom/disney/id/android/DIDOptionalConfigs;

    invoke-virtual {p0, v0}, Lcom/disney/id/android/DIDSession;->launchLogin(Lcom/disney/id/android/DIDOptionalConfigs;)V

    .line 198
    return-void
.end method

.method public launchLogin(Lcom/disney/id/android/DIDOptionalConfigs;)V
    .locals 3
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSession;->ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/DIDSession;->launchLogin_aroundBody5$advice(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public launchLogin(Ljava/lang/String;)V
    .locals 0
    .param p1, "override"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 205
    invoke-virtual {p0}, Lcom/disney/id/android/DIDSession;->launchLogin()V

    .line 206
    return-void
.end method

.method public launchNewsletters(Lcom/disney/id/android/DIDOptionalConfigs;Ljava/lang/String;)V
    .locals 6
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;
    .param p2, "promotionId"    # Ljava/lang/String;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSession;->ajc$tjp_15:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1, p2}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v3

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v4

    move-object v5, v3

    check-cast v5, Lorg/aspectj/lang/ProceedingJoinPoint;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-static/range {v0 .. v5}, Lcom/disney/id/android/DIDSession;->launchNewsletters_aroundBody31$advice(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public launchNewsletters(Ljava/lang/String;)V
    .locals 1
    .param p1, "promotionId"    # Ljava/lang/String;

    .prologue
    .line 629
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/disney/id/android/DIDSession;->launchNewsletters(Lcom/disney/id/android/DIDOptionalConfigs;Ljava/lang/String;)V

    .line 630
    return-void
.end method

.method public launchNewsletters(Ljava/lang/String;Lcom/disney/id/android/DIDOptionalConfigs;)V
    .locals 0
    .param p1, "promotionId"    # Ljava/lang/String;
    .param p2, "transactionalConfigs"    # Lcom/disney/id/android/DIDOptionalConfigs;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 640
    invoke-virtual {p0, p2, p1}, Lcom/disney/id/android/DIDSession;->launchNewsletters(Lcom/disney/id/android/DIDOptionalConfigs;Ljava/lang/String;)V

    .line 641
    return-void
.end method

.method public launchProfile()V
    .locals 1

    .prologue
    .line 355
    const/4 v0, 0x0

    check-cast v0, Lcom/disney/id/android/DIDOptionalConfigs;

    invoke-virtual {p0, v0}, Lcom/disney/id/android/DIDSession;->launchProfile(Lcom/disney/id/android/DIDOptionalConfigs;)V

    .line 356
    return-void
.end method

.method public launchProfile(Lcom/disney/id/android/DIDOptionalConfigs;)V
    .locals 3
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSession;->ajc$tjp_7:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/DIDSession;->launchProfile_aroundBody15$advice(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public launchProfile(Ljava/lang/String;)V
    .locals 0
    .param p1, "override"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 363
    invoke-virtual {p0}, Lcom/disney/id/android/DIDSession;->launchProfile()V

    .line 364
    return-void
.end method

.method public launchReauth()V
    .locals 1

    .prologue
    .line 227
    const/4 v0, 0x0

    check-cast v0, Lcom/disney/id/android/DIDOptionalConfigs;

    invoke-virtual {p0, v0}, Lcom/disney/id/android/DIDSession;->launchReauth(Lcom/disney/id/android/DIDOptionalConfigs;)V

    .line 228
    return-void
.end method

.method public launchReauth(Lcom/disney/id/android/DIDOptionalConfigs;)V
    .locals 3
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSession;->ajc$tjp_3:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/DIDSession;->launchReauth_aroundBody7$advice(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public launchReauth(Ljava/lang/String;)V
    .locals 0
    .param p1, "override"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 236
    invoke-virtual {p0}, Lcom/disney/id/android/DIDSession;->launchReauth()V

    .line 237
    return-void
.end method

.method public launchRecoverUsername()V
    .locals 1

    .prologue
    .line 378
    const/4 v0, 0x0

    check-cast v0, Lcom/disney/id/android/DIDOptionalConfigs;

    invoke-virtual {p0, v0}, Lcom/disney/id/android/DIDSession;->launchRecoverUsername(Lcom/disney/id/android/DIDOptionalConfigs;)V

    .line 379
    return-void
.end method

.method public launchRecoverUsername(Lcom/disney/id/android/DIDOptionalConfigs;)V
    .locals 3
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSession;->ajc$tjp_8:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/DIDSession;->launchRecoverUsername_aroundBody17$advice(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public launchRecoverUsername(Ljava/lang/String;)V
    .locals 0
    .param p1, "override"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 386
    invoke-virtual {p0}, Lcom/disney/id/android/DIDSession;->launchRecoverUsername()V

    .line 387
    return-void
.end method

.method public launchRegistration()V
    .locals 1

    .prologue
    .line 332
    const/4 v0, 0x0

    check-cast v0, Lcom/disney/id/android/DIDOptionalConfigs;

    invoke-virtual {p0, v0}, Lcom/disney/id/android/DIDSession;->launchRegistration(Lcom/disney/id/android/DIDOptionalConfigs;)V

    .line 333
    return-void
.end method

.method public launchRegistration(Lcom/disney/id/android/DIDOptionalConfigs;)V
    .locals 3
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSession;->ajc$tjp_6:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/DIDSession;->launchRegistration_aroundBody13$advice(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public launchRegistration(Ljava/lang/String;)V
    .locals 0
    .param p1, "override"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 340
    invoke-virtual {p0}, Lcom/disney/id/android/DIDSession;->launchRegistration()V

    .line 341
    return-void
.end method

.method public launchRequestActivity(Lcom/disney/id/android/DIDOptionalConfigs;Ljava/lang/String;)V
    .locals 2
    .param p1, "optionalConfigs"    # Lcom/disney/id/android/DIDOptionalConfigs;
    .param p2, "activityCode"    # Ljava/lang/String;

    .prologue
    .line 456
    invoke-virtual {p0, p1}, Lcom/disney/id/android/DIDSession;->getJSON(Lcom/disney/id/android/DIDOptionalConfigs;)Lorg/json/JSONObject;

    move-result-object v0

    .line 458
    .local v0, "json":Lorg/json/JSONObject;
    :try_start_0
    const-string v1, "activityCode"

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 463
    :goto_0
    const/16 v1, 0x109

    invoke-virtual {p0, v1, v0}, Lcom/disney/id/android/DIDSession;->startRequest(ILorg/json/JSONObject;)V

    .line 464
    return-void

    .line 459
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public launchResetPassword()V
    .locals 1

    .prologue
    .line 401
    const/4 v0, 0x0

    check-cast v0, Lcom/disney/id/android/DIDOptionalConfigs;

    invoke-virtual {p0, v0}, Lcom/disney/id/android/DIDSession;->launchResetPassword(Lcom/disney/id/android/DIDOptionalConfigs;)V

    .line 402
    return-void
.end method

.method public launchResetPassword(Lcom/disney/id/android/DIDOptionalConfigs;)V
    .locals 3
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSession;->ajc$tjp_9:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/DIDSession;->launchResetPassword_aroundBody19$advice(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public launchResetPassword(Ljava/lang/String;)V
    .locals 0
    .param p1, "override"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 409
    invoke-virtual {p0}, Lcom/disney/id/android/DIDSession;->launchResetPassword()V

    .line 410
    return-void
.end method

.method public launchSocialRegistration()V
    .locals 1

    .prologue
    .line 252
    const/4 v0, 0x0

    check-cast v0, Lcom/disney/id/android/DIDOptionalConfigs;

    invoke-virtual {p0, v0}, Lcom/disney/id/android/DIDSession;->launchSocialRegistration(Lcom/disney/id/android/DIDOptionalConfigs;)V

    .line 253
    return-void
.end method

.method public launchSocialRegistration(Lcom/disney/id/android/DIDOptionalConfigs;)V
    .locals 3
    .param p1, "options"    # Lcom/disney/id/android/DIDOptionalConfigs;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSession;->ajc$tjp_4:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/DIDSession;->launchSocialRegistration_aroundBody9$advice(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDOptionalConfigs;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public launchSocialRegistration(Ljava/lang/String;)V
    .locals 0
    .param p1, "override"    # Ljava/lang/String;

    .prologue
    .line 259
    invoke-virtual {p0}, Lcom/disney/id/android/DIDSession;->launchSocialRegistration()V

    .line 260
    return-void
.end method

.method public logout()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSession;->ajc$tjp_11:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/DIDSession;->logout_aroundBody23$advice(Lcom/disney/id/android/DIDSession;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public migrateFromBlueCookie(Ljava/lang/String;)V
    .locals 3
    .param p1, "blueCookie"    # Ljava/lang/String;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSession;->ajc$tjp_14:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/DIDSession;->migrateFromBlueCookie_aroundBody29$advice(Lcom/disney/id/android/DIDSession;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public migrateFromBlueCookie(Ljava/lang/String;Lcom/disney/id/android/DIDSession$RequestSuccess;Lcom/disney/id/android/DIDSession$RequestFailure;)V
    .locals 3
    .param p1, "blueCookie"    # Ljava/lang/String;
    .param p2, "loginSuccessAction"    # Lcom/disney/id/android/DIDSession$RequestSuccess;
    .param p3, "loginFailureAction"    # Lcom/disney/id/android/DIDSession$RequestFailure;

    .prologue
    .line 580
    iget-object v0, p0, Lcom/disney/id/android/DIDSession;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->sharedInstance(Landroid/content/Context;)Lcom/disney/id/android/InternalImprovedDIDSessionManager;

    move-result-object v0

    new-instance v1, Lcom/disney/id/android/DIDSession$5;

    invoke-direct {v1, p0, p2}, Lcom/disney/id/android/DIDSession$5;-><init>(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDSession$RequestSuccess;)V

    new-instance v2, Lcom/disney/id/android/DIDSession$6;

    invoke-direct {v2, p0, p3}, Lcom/disney/id/android/DIDSession$6;-><init>(Lcom/disney/id/android/DIDSession;Lcom/disney/id/android/DIDSession$RequestFailure;)V

    invoke-virtual {v0, p1, v1, v2}, Lcom/disney/id/android/InternalImprovedDIDSessionManager;->loginWithBlueCookie(Ljava/lang/String;Lcom/disney/id/android/IDIDSessionManager$RequestSuccess;Lcom/disney/id/android/IDIDSessionManager$RequestFailure;)V

    .line 601
    return-void
.end method

.method public onTokenRefreshFailure(Lcom/disney/id/android/DIDSessionManagerFailure;)V
    .locals 4
    .param p1, "failure"    # Lcom/disney/id/android/DIDSessionManagerFailure;

    .prologue
    const/4 v3, 0x0

    .line 657
    new-instance v0, Lcom/disney/id/android/DIDException;

    invoke-direct {v0, p1}, Lcom/disney/id/android/DIDException;-><init>(Ljava/lang/Throwable;)V

    .line 658
    .local v0, "exception":Lcom/disney/id/android/DIDException;
    iget-object v2, p0, Lcom/disney/id/android/DIDSession;->mCallback:Lcom/disney/id/android/DIDSessionDelegate;

    invoke-interface {v2, v0}, Lcom/disney/id/android/DIDSessionDelegate;->onForceTokenRefreshFailure(Lcom/disney/id/android/DIDException;)V

    .line 659
    iget-object v2, p0, Lcom/disney/id/android/DIDSession;->forceTokenRefreshFailureAction:Lcom/disney/id/android/DIDSession$RequestFailure;

    if-eqz v2, :cond_0

    .line 660
    iput-object v3, p0, Lcom/disney/id/android/DIDSession;->forceTokenRefreshSuccessAction:Lcom/disney/id/android/DIDSession$RequestSuccess;

    .line 661
    iget-object v2, p0, Lcom/disney/id/android/DIDSession;->forceTokenRefreshFailureAction:Lcom/disney/id/android/DIDSession$RequestFailure;

    invoke-interface {v2, v0}, Lcom/disney/id/android/DIDSession$RequestFailure;->onFailure(Lcom/disney/id/android/DIDException;)V

    .line 662
    iput-object v3, p0, Lcom/disney/id/android/DIDSession;->forceTokenRefreshFailureAction:Lcom/disney/id/android/DIDSession$RequestFailure;

    .line 664
    :cond_0
    invoke-virtual {p1}, Lcom/disney/id/android/DIDSessionManagerFailure;->isForcedLogout()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 665
    invoke-virtual {p0}, Lcom/disney/id/android/DIDSession;->logout()V

    .line 672
    :cond_1
    :goto_0
    return-void

    .line 667
    :cond_2
    invoke-virtual {p1}, Lcom/disney/id/android/DIDSessionManagerFailure;->getFailureInformation()Lorg/json/JSONObject;

    move-result-object v1

    .line 668
    .local v1, "failureInformation":Lorg/json/JSONObject;
    if-eqz v1, :cond_1

    .line 669
    const/16 v2, 0x204

    invoke-virtual {p1}, Lcom/disney/id/android/DIDSessionManagerFailure;->getFailureInformation()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/disney/id/android/DIDSession;->startRequest(ILorg/json/JSONObject;)V

    goto :goto_0
.end method

.method public onTokenRefreshSuccess(Lcom/disney/id/android/AdditionalAction;)V
    .locals 3
    .param p1, "additionalAction"    # Lcom/disney/id/android/AdditionalAction;

    .prologue
    const/4 v2, 0x0

    .line 646
    iget-object v0, p0, Lcom/disney/id/android/DIDSession;->mCallback:Lcom/disney/id/android/DIDSessionDelegate;

    invoke-interface {v0}, Lcom/disney/id/android/DIDSessionDelegate;->onForceTokenRefreshSuccess()V

    .line 647
    iget-object v0, p0, Lcom/disney/id/android/DIDSession;->forceTokenRefreshSuccessAction:Lcom/disney/id/android/DIDSession$RequestSuccess;

    if-eqz v0, :cond_0

    .line 648
    iput-object v2, p0, Lcom/disney/id/android/DIDSession;->forceTokenRefreshFailureAction:Lcom/disney/id/android/DIDSession$RequestFailure;

    .line 649
    iget-object v0, p0, Lcom/disney/id/android/DIDSession;->forceTokenRefreshSuccessAction:Lcom/disney/id/android/DIDSession$RequestSuccess;

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getTokenJSON()Lorg/json/JSONObject;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/disney/id/android/DIDSession$RequestSuccess;->onSuccess(Lorg/json/JSONObject;)V

    .line 650
    iput-object v2, p0, Lcom/disney/id/android/DIDSession;->forceTokenRefreshSuccessAction:Lcom/disney/id/android/DIDSession$RequestSuccess;

    .line 652
    :cond_0
    invoke-virtual {p0, p1}, Lcom/disney/id/android/DIDSession;->handleAdditionalAction(Lcom/disney/id/android/AdditionalAction;)V

    .line 653
    return-void
.end method

.method public refreshGuestData()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSession;->ajc$tjp_12:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/DIDSession;->refreshGuestData_aroundBody25$advice(Lcom/disney/id/android/DIDSession;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public setDefaultOptionalConfigs(Lcom/disney/id/android/DIDOptionalConfigs;)V
    .locals 0
    .param p1, "defaultOptionalConfigs"    # Lcom/disney/id/android/DIDOptionalConfigs;

    .prologue
    .line 100
    iput-object p1, p0, Lcom/disney/id/android/DIDSession;->mDefaultOptionalConfigs:Lcom/disney/id/android/DIDOptionalConfigs;

    .line 101
    return-void
.end method

.method public setDoNotDisturb(Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "doNotDisturb"    # Ljava/lang/Boolean;

    .prologue
    .line 540
    invoke-static {p1}, Lcom/disney/id/android/DIDSessionConfig;->setDoNotDisturb(Ljava/lang/Boolean;)V

    .line 541
    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getDoNotDisturb()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getCanUseSite()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 542
    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getCanUseSiteRequest()Lcom/disney/id/android/DIDRequest;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/disney/id/android/DIDSession;->startRequest(Lcom/disney/id/android/DIDRequest;Z)V

    .line 543
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionConfig;->setCanUseSiteRequest(Lcom/disney/id/android/DIDRequest;)V

    .line 545
    :cond_0
    return-void
.end method

.method public start()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSession;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/DIDSession;->start_aroundBody1$advice(Lcom/disney/id/android/DIDSession;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public stop()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDSession;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/DIDSession;->stop_aroundBody3$advice(Lcom/disney/id/android/DIDSession;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method
