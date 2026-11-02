.class Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;
.super Ljava/lang/Object;
.source "DIDLightBoxActivity.java"

# interfaces
.implements Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->createBridgeOwner()Lcom/disney/id/android/lightboxinteraction/DIDWebViewBridgeOwner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field private static final ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_3:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_4:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_5:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_6:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_7:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_8:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_9:Lorg/aspectj/lang/JoinPoint$StaticPart;


# instance fields
.field private hasStartedProgressTracking:Z

.field final synthetic this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

.field private final wasWebViewLoadingUponCreation:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .prologue
    .line 1
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->ajc$preClinit()V

    return-void
.end method

.method constructor <init>(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)V
    .locals 1

    .prologue
    .line 312
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 314
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$000(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->isWebViewLoading()Z

    move-result v0

    iput-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->wasWebViewLoadingUponCreation:Z

    .line 315
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->hasStartedProgressTracking:Z

    return-void
.end method

.method private static ajc$preClinit()V
    .locals 9

    .prologue
    .line 1
    new-instance v0, Lorg/aspectj/runtime/reflect/Factory;

    const-string v1, "DIDLightBoxActivity.java"

    const-class v2, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;

    invoke-direct {v0, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "onPageStarted"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity$1"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x13f

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "onProgressChanged"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity$1"

    const-string v4, "int"

    const-string v5, "newProgress"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x149

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "onReady"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity$1"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x15b

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "onCloseWindow"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity$1"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x16a

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->ajc$tjp_3:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "onCreateWindow"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity$1"

    const-string v4, "android.webkit.WebView:boolean:boolean:android.os.Message"

    const-string v5, "view:isDialog:isUserGesture:resultMsg"

    const-string v6, ""

    const-string v7, "boolean"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x174

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->ajc$tjp_4:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "onResponse"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity$1"

    const-string v4, "com.disney.id.android.DIDResponse"

    const-string v5, "response"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x1a4

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->ajc$tjp_5:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "onFinish"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity$1"

    const-string v4, "com.disney.id.android.DIDResponse"

    const-string v5, "response"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x1ae

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->ajc$tjp_6:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "showLoader"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity$1"

    const-string v4, "boolean"

    const-string v5, "show"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x1bb

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->ajc$tjp_7:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "showClose"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity$1"

    const-string v4, "boolean:boolean"

    const-string v5, "showCloseButton:stopCloseEvent"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x1c4

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->ajc$tjp_8:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "externalLogin"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxActivity$1"

    const-string v4, "java.lang.String:java.lang.String"

    const-string v5, "request:options"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x1ce

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->ajc$tjp_9:Lorg/aspectj/lang/JoinPoint$StaticPart;

    return-void
.end method

.method private static final externalLogin_aroundBody18(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Ljava/lang/String;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V
    .locals 7
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;
    .param p1, "request"    # Ljava/lang/String;
    .param p2, "options"    # Ljava/lang/String;

    .prologue
    .line 462
    const-string v4, "PRELOAD_INFO"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "externalLogin called with request "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 463
    invoke-static {p1}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 464
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$500()Ljava/lang/String;

    move-result-object v4

    const-string v5, "externalLogin bad request null"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 488
    :goto_0
    return-void

    .line 468
    :cond_0
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 469
    .local v3, "reqJSON":Lorg/json/JSONObject;
    const-string v4, "namespace"

    invoke-static {v3, v4}, Lcom/disney/id/android/DIDUtils;->hasKey(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 470
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$500()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "externalLogin bad request "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 485
    .end local v3    # "reqJSON":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 486
    .local v1, "ignore":Lorg/json/JSONException;
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$500()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "unexpected exception "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 475
    .end local v1    # "ignore":Lorg/json/JSONException;
    .restart local v3    # "reqJSON":Lorg/json/JSONObject;
    :cond_1
    :try_start_1
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 476
    .local v2, "optionalConfigs":Lorg/json/JSONObject;
    const-string v4, "optionalConfigs"

    const-string v5, "optionalConfigs"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 477
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    .line 479
    .local v0, "forwardRequest":Ljava/lang/String;
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$500()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "DIDSocialRegistrationActivity request: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 480
    iget-object v4, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    new-instance v5, Lcom/disney/id/android/DIDRequest;

    const-string v6, "namespace"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/disney/id/android/external/DIDExternalUtils;->getRequestCode(Ljava/lang/String;)I

    move-result v6

    invoke-direct {v5, v6, v0}, Lcom/disney/id/android/DIDRequest;-><init>(ILjava/lang/String;)V

    invoke-static {v4, v5}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$302(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Lcom/disney/id/android/DIDRequest;)Lcom/disney/id/android/DIDRequest;

    .line 484
    new-instance v4, Lcom/disney/id/android/DIDActivityLauncher;

    iget-object v5, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v5}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$400(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Landroid/content/Context;

    move-result-object v5

    const-class v6, Lcom/disney/id/android/guestcontrollerinteraction/DIDSocialRegistrationActivity;

    invoke-direct {v4, v5, v6}, Lcom/disney/id/android/DIDActivityLauncher;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v5, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v5}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$300(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Lcom/disney/id/android/DIDRequest;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/disney/id/android/DIDActivityLauncher;->attemptLaunchAndSaveCurrentActivity(Lcom/disney/id/android/DIDRequest;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method private static final externalLogin_aroundBody19$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Ljava/lang/String;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;
    .param p1, "request"    # Ljava/lang/String;
    .param p2, "options"    # Ljava/lang/String;
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
    invoke-static {p0, p1, p2, p5}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->externalLogin_aroundBody18(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Ljava/lang/String;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final onCloseWindow_aroundBody6(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Lorg/aspectj/lang/JoinPoint;)V
    .locals 3
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;

    .prologue
    .line 362
    const-string v1, "PRELOAD_INFO"

    const-string v2, "web view owner\'s onCloseWindow() called"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 363
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 364
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0x10

    iput v1, v0, Landroid/os/Message;->what:I

    .line 365
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$100(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->sendMessage(Landroid/os/Message;)Z

    .line 366
    return-void
.end method

.method private static final onCloseWindow_aroundBody7$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->onCloseWindow_aroundBody6(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final onCreateWindow_aroundBody8(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Landroid/webkit/WebView;ZZLandroid/os/Message;Lorg/aspectj/lang/JoinPoint;)Z
    .locals 6
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "isDialog"    # Z
    .param p3, "isUserGesture"    # Z
    .param p4, "resultMsg"    # Landroid/os/Message;

    .prologue
    .line 372
    const-string v4, "PRELOAD_INFO"

    const-string v5, "web view owner\'s onCreateWindow() called"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 374
    :try_start_0
    new-instance v0, Landroid/webkit/WebView;

    iget-object v4, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v4}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$400(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Landroid/content/Context;

    move-result-object v4

    invoke-direct {v0, v4}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 375
    .local v0, "childView":Landroid/webkit/WebView;
    new-instance v4, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;

    invoke-direct {v4, p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1$1;-><init>(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;)V

    invoke-virtual {v0, v4}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 401
    iget-object v4, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v4}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$600(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;

    move-result-object v4

    invoke-virtual {v4, v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewGroup;->push(Landroid/view/View;)V

    .line 403
    iget-object v3, p4, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/webkit/WebView$WebViewTransport;

    .line 404
    .local v3, "transport":Landroid/webkit/WebView$WebViewTransport;
    if-eqz v3, :cond_0

    .line 405
    invoke-virtual {v3, v0}, Landroid/webkit/WebView$WebViewTransport;->setWebView(Landroid/webkit/WebView;)V

    .line 406
    :cond_0
    invoke-virtual {p4}, Landroid/os/Message;->sendToTarget()V

    .line 408
    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    .line 409
    .local v1, "msg":Landroid/os/Message;
    const/16 v4, 0x11

    iput v4, v1, Landroid/os/Message;->what:I

    .line 410
    iget-object v4, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v4}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$100(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;

    move-result-object v4

    invoke-virtual {v4, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 414
    .end local v0    # "childView":Landroid/webkit/WebView;
    .end local v1    # "msg":Landroid/os/Message;
    .end local v3    # "transport":Landroid/webkit/WebView$WebViewTransport;
    :goto_0
    const/4 v4, 0x1

    return v4

    .line 411
    :catch_0
    move-exception v2

    .line 412
    .local v2, "t":Ljava/lang/Throwable;
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$500()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "onCreateWindow()"

    invoke-static {v4, v5, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private static final onCreateWindow_aroundBody9$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Landroid/webkit/WebView;ZZLandroid/os/Message;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 11
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "isDialog"    # Z
    .param p3, "isUserGesture"    # Z
    .param p4, "resultMsg"    # Landroid/os/Message;
    .param p5, "thisJoinPoint"    # Lorg/aspectj/lang/JoinPoint;
    .param p6, "ajc$aspectInstance"    # Lcom/disney/id/android/gintonic/aspect/TraceAspect;
    .param p7, "joinPoint"    # Lorg/aspectj/lang/ProceedingJoinPoint;

    .prologue
    .line 36
    invoke-interface/range {p7 .. p7}, Lorg/aspectj/lang/ProceedingJoinPoint;->getSignature()Lorg/aspectj/lang/Signature;

    move-result-object v8

    check-cast v8, Lorg/aspectj/lang/reflect/MethodSignature;

    .line 37
    .local v8, "methodSignature":Lorg/aspectj/lang/reflect/MethodSignature;
    invoke-interface {v8}, Lorg/aspectj/lang/reflect/MethodSignature;->getDeclaringType()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    .line 38
    .local v6, "className":Ljava/lang/String;
    invoke-interface {v8}, Lorg/aspectj/lang/reflect/MethodSignature;->getName()Ljava/lang/String;

    move-result-object v7

    .line 40
    .local v7, "methodName":Ljava/lang/String;
    new-instance v10, Lcom/disney/id/android/gintonic/internal/StopWatch;

    invoke-direct {v10}, Lcom/disney/id/android/gintonic/internal/StopWatch;-><init>()V

    .line 41
    .local v10, "stopWatch":Lcom/disney/id/android/gintonic/internal/StopWatch;
    invoke-virtual {v10}, Lcom/disney/id/android/gintonic/internal/StopWatch;->start()V

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move-object/from16 v5, p7

    .line 42
    invoke-static/range {v0 .. v5}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->onCreateWindow_aroundBody8(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Landroid/webkit/WebView;ZZLandroid/os/Message;Lorg/aspectj/lang/JoinPoint;)Z

    move-result v0

    invoke-static {v0}, Lorg/aspectj/runtime/internal/Conversions;->booleanObject(Z)Ljava/lang/Object;

    move-result-object v9

    .line 43
    .local v9, "result":Ljava/lang/Object;
    invoke-virtual {v10}, Lcom/disney/id/android/gintonic/internal/StopWatch;->stop()V

    .line 45
    invoke-virtual {v10}, Lcom/disney/id/android/gintonic/internal/StopWatch;->getTotalTimeMillis()J

    move-result-wide v0

    invoke-static {v7, v0, v1}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->ajc$inlineAccessMethod$com_disney_id_android_gintonic_aspect_TraceAspect$com_disney_id_android_gintonic_aspect_TraceAspect$buildLogMessage(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    return-object v9
.end method

.method private static final onFinish_aroundBody12(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Lcom/disney/id/android/DIDResponse;Lorg/aspectj/lang/JoinPoint;)V
    .locals 3
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;
    .param p1, "response"    # Lcom/disney/id/android/DIDResponse;

    .prologue
    .line 430
    const-string v0, "PRELOAD_INFO"

    const-string v1, "web view owner\'s onFinish() called"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 431
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$400(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDUtils;->isContextAlive(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 432
    if-eqz p1, :cond_0

    .line 433
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-virtual {p1}, Lcom/disney/id/android/DIDResponse;->getResponseCode()I

    move-result v1

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-virtual {v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->setResult(ILandroid/content/Intent;)V

    .line 435
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$000(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    move-result-object v0

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->prepareToDisplayNextPage()V

    .line 436
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-virtual {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->finish()V

    .line 438
    :cond_1
    return-void
.end method

.method private static final onFinish_aroundBody13$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Lcom/disney/id/android/DIDResponse;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->onFinish_aroundBody12(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Lcom/disney/id/android/DIDResponse;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final onPageStarted_aroundBody0(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Lorg/aspectj/lang/JoinPoint;)V
    .locals 3
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;

    .prologue
    .line 319
    const-string v1, "PRELOAD_INFO"

    const-string v2, "web view owner\'s onPageStarted() called"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 321
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0x9

    iput v1, v0, Landroid/os/Message;->what:I

    .line 322
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$100(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->sendMessage(Landroid/os/Message;)Z

    .line 323
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->hasStartedProgressTracking:Z

    .line 324
    return-void
.end method

.method private static final onPageStarted_aroundBody1$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->onPageStarted_aroundBody0(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final onProgressChanged_aroundBody2(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;ILorg/aspectj/lang/JoinPoint;)V
    .locals 4
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;
    .param p1, "newProgress"    # I

    .prologue
    .line 329
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 331
    .local v0, "message":Landroid/os/Message;
    iget-boolean v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->wasWebViewLoadingUponCreation:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->hasStartedProgressTracking:Z

    if-nez v1, :cond_0

    .line 332
    const-string v1, "PRELOAD_INFO"

    const-string v2, "the web view has already been loading, but we hadn\'t been tracking progress in the WebActivity\'s bridge owner. That starts now"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->hasStartedProgressTracking:Z

    .line 334
    const/16 v1, 0x9

    iput v1, v0, Landroid/os/Message;->what:I

    .line 341
    :goto_0
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$100(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->sendMessage(Landroid/os/Message;)Z

    .line 342
    return-void

    .line 336
    :cond_0
    const-string v1, "PRELOAD_INFO"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "web view owner\'s onProgressChanged() called, progress = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 337
    const/16 v1, 0x17

    iput v1, v0, Landroid/os/Message;->what:I

    .line 338
    iput p1, v0, Landroid/os/Message;->arg1:I

    goto :goto_0
.end method

.method private static final onProgressChanged_aroundBody3$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;ILorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;
    .param p1, "newProgress"    # I
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->onProgressChanged_aroundBody2(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;ILorg/aspectj/lang/JoinPoint;)V

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

.method private static final onReady_aroundBody4(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Lorg/aspectj/lang/JoinPoint;)V
    .locals 3
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;

    .prologue
    .line 347
    const-string v1, "PRELOAD_INFO"

    const-string v2, "web view owner\'s onReady() called"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 348
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$200(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)V

    .line 349
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$000(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->hasMadeRequest()Z

    move-result v1

    if-nez v1, :cond_0

    .line 350
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$000(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxInteraction;->handleRequest()V

    .line 351
    :cond_0
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$300(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Lcom/disney/id/android/DIDRequest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v1

    invoke-static {v1}, Lcom/disney/id/android/DIDWebUtils;->isSilentRequest(I)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$300(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Lcom/disney/id/android/DIDRequest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v1

    const/16 v2, 0x107

    if-ne v1, v2, :cond_2

    .line 353
    :cond_1
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 354
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0x8

    iput v1, v0, Landroid/os/Message;->what:I

    .line 355
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$100(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->sendMessage(Landroid/os/Message;)Z

    .line 357
    .end local v0    # "msg":Landroid/os/Message;
    :cond_2
    return-void
.end method

.method private static final onReady_aroundBody5$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->onReady_aroundBody4(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final onResponse_aroundBody10(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Lcom/disney/id/android/DIDResponse;Lorg/aspectj/lang/JoinPoint;)V
    .locals 3
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;
    .param p1, "response"    # Lcom/disney/id/android/DIDResponse;

    .prologue
    .line 420
    const-string v0, "PRELOAD_INFO"

    const-string v1, "web view owner\'s onResponse() called"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 421
    if-eqz p1, :cond_0

    .line 422
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-virtual {p1}, Lcom/disney/id/android/DIDResponse;->getResponseCode()I

    move-result v1

    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-virtual {v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->setResult(ILandroid/content/Intent;)V

    .line 423
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$400(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/DIDSessionManager;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDSessionManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/disney/id/android/DIDSessionManager;->sendResponse(Lcom/disney/id/android/DIDResponse;)V

    .line 425
    :cond_0
    return-void
.end method

.method private static final onResponse_aroundBody11$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Lcom/disney/id/android/DIDResponse;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->onResponse_aroundBody10(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Lcom/disney/id/android/DIDResponse;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final showClose_aroundBody16(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;ZZLorg/aspectj/lang/JoinPoint;)V
    .locals 3
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;
    .param p1, "showCloseButton"    # Z
    .param p2, "stopCloseEvent"    # Z

    .prologue
    .line 452
    const-string v0, "PRELOAD_INFO"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "web view owner\'s showClose(showCloseButton="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", stopCloseEvent="

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

    .line 453
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$702(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Z)Z

    .line 454
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v0, p2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$802(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;Z)Z

    .line 456
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$100(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$900(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->sendMessage(Landroid/os/Message;)Z

    .line 457
    return-void
.end method

.method private static final showClose_aroundBody17$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;ZZLorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;
    .param p1, "showCloseButton"    # Z
    .param p2, "stopCloseEvent"    # Z
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
    invoke-static {p0, p1, p2, p5}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->showClose_aroundBody16(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;ZZLorg/aspectj/lang/JoinPoint;)V

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

.method private static final showLoader_aroundBody14(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;ZLorg/aspectj/lang/JoinPoint;)V
    .locals 4
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;
    .param p1, "show"    # Z

    .prologue
    .line 443
    const-string v1, "PRELOAD_INFO"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "web view owner\'s showLoader("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") called"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 444
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 445
    .local v0, "msg":Landroid/os/Message;
    if-eqz p1, :cond_0

    const/16 v1, 0x13

    :goto_0
    iput v1, v0, Landroid/os/Message;->what:I

    .line 446
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->this$0:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;

    invoke-static {v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;->access$100(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity;)Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/disney/id/android/lightboxinteraction/DIDWebViewStateHandler;->sendMessage(Landroid/os/Message;)Z

    .line 447
    return-void

    .line 445
    :cond_0
    const/16 v1, 0x14

    goto :goto_0
.end method

.method private static final showLoader_aroundBody15$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;ZLorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;
    .param p1, "show"    # Z
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->showLoader_aroundBody14(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;ZLorg/aspectj/lang/JoinPoint;)V

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
.method public externalLogin(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "request"    # Ljava/lang/String;
    .param p2, "options"    # Ljava/lang/String;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->ajc$tjp_9:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1, p2}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v3

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v4

    move-object v5, v3

    check-cast v5, Lorg/aspectj/lang/ProceedingJoinPoint;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-static/range {v0 .. v5}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->externalLogin_aroundBody19$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Ljava/lang/String;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public onCloseWindow()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->ajc$tjp_3:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->onCloseWindow_aroundBody7$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public onCreateWindow(Landroid/webkit/WebView;ZZLandroid/os/Message;)Z
    .locals 8
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "isDialog"    # Z
    .param p3, "isUserGesture"    # Z
    .param p4, "resultMsg"    # Landroid/os/Message;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->ajc$tjp_4:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    invoke-static {p2}, Lorg/aspectj/runtime/internal/Conversions;->booleanObject(Z)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p3}, Lorg/aspectj/runtime/internal/Conversions;->booleanObject(Z)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    aput-object p4, v1, v2

    invoke-static {v0, p0, p0, v1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v5

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v6

    move-object v7, v5

    check-cast v7, Lorg/aspectj/lang/ProceedingJoinPoint;

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v7}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->onCreateWindow_aroundBody9$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Landroid/webkit/WebView;ZZLandroid/os/Message;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lorg/aspectj/runtime/internal/Conversions;->booleanValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public onFinish(Lcom/disney/id/android/DIDResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/disney/id/android/DIDResponse;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->ajc$tjp_6:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->onFinish_aroundBody13$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Lcom/disney/id/android/DIDResponse;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public onPageStarted()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->onPageStarted_aroundBody1$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public onProgressChanged(I)V
    .locals 3
    .param p1, "newProgress"    # I
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {p1}, Lorg/aspectj/runtime/internal/Conversions;->intObject(I)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, p0, p0, v1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->onProgressChanged_aroundBody3$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;ILorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public onReady()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->onReady_aroundBody5$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public onResponse(Lcom/disney/id/android/DIDResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/disney/id/android/DIDResponse;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->ajc$tjp_5:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->onResponse_aroundBody11$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;Lcom/disney/id/android/DIDResponse;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public showClose(ZZ)V
    .locals 6
    .param p1, "showCloseButton"    # Z
    .param p2, "stopCloseEvent"    # Z
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->ajc$tjp_8:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {p1}, Lorg/aspectj/runtime/internal/Conversions;->booleanObject(Z)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p2}, Lorg/aspectj/runtime/internal/Conversions;->booleanObject(Z)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, p0, p0, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v3

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v4

    move-object v5, v3

    check-cast v5, Lorg/aspectj/lang/ProceedingJoinPoint;

    move-object v0, p0

    move v1, p1

    move v2, p2

    invoke-static/range {v0 .. v5}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->showClose_aroundBody17$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;ZZLorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public showLoader(Z)V
    .locals 3
    .param p1, "show"    # Z
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->ajc$tjp_7:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {p1}, Lorg/aspectj/runtime/internal/Conversions;->booleanObject(Z)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, p0, p0, v1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;->showLoader_aroundBody15$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxActivity$1;ZLorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method
