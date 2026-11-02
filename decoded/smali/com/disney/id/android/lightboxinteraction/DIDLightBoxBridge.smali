.class Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
.super Ljava/lang/Object;
.source "DIDLightBoxBridge.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;
    }
.end annotation


# static fields
.field private static final ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_10:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_11:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_12:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_13:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_14:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_15:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_16:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_17:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_3:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_4:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_5:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_6:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_7:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_8:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_9:Lorg/aspectj/lang/JoinPoint$StaticPart;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private coordination:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;

.field private isHandlingSocialInteraction:Z

.field private isReady:Z

.field private mLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

.field private webCommunication:Lcom/disney/id/android/lightboxinteraction/DIDWebCommunication;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .prologue
    .line 1
    invoke-static {}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$preClinit()V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "coordination"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;

    .prologue
    const/4 v1, 0x0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const-class v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->TAG:Ljava/lang/String;

    .line 21
    iput-boolean v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->isReady:Z

    .line 23
    iput-boolean v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->isHandlingSocialInteraction:Z

    .line 43
    new-instance v0, Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->mLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    .line 44
    iput-object p2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->coordination:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;

    .line 45
    return-void
.end method

.method private static ajc$preClinit()V
    .locals 9

    .prologue
    .line 1
    new-instance v0, Lorg/aspectj/runtime/reflect/Factory;

    const-string v1, "DIDLightBoxBridge.java"

    const-class v2, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    invoke-direct {v0, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    const-string v8, "method-execution"

    const-string v1, "0"

    const-string v2, "showPage"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxBridge"

    const-string v4, "com.disney.id.android.lightboxinteraction.DIDLightBoxPageName:java.lang.String"

    const-string v5, "pageName:data"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x39

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "0"

    const-string v2, "requestClose"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxBridge"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x47

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "loginSuccess"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxBridge"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xb9

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_10:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "reauthSuccess"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxBridge"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xc1

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_11:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "createSuccess"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxBridge"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xd0

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_12:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "updateSuccess"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxBridge"

    const-string v4, "java.lang.String"

    const-string v5, "delta"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xd7

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_13:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "externalLogin"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxBridge"

    const-string v4, "java.lang.String"

    const-string v5, "data"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xdd

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_14:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "sendLogs"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxBridge"

    const-string v4, "java.lang.String"

    const-string v5, "data"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xe5

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_15:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "sendMetrics"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxBridge"

    const-string v4, "java.lang.String"

    const-string v5, "data"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xeb

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_16:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "optInSuccess"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxBridge"

    const-string v4, "java.lang.String"

    const-string v5, "newsletters"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xf1

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_17:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "bridgeReady"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxBridge"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x5f

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "setData"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxBridge"

    const-string v4, "java.lang.String"

    const-string v5, "data"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x68

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_3:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "getData"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxBridge"

    const-string v4, "java.lang.String"

    const-string v5, "data"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x7a

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_4:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "clearData"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxBridge"

    const-string v4, "java.lang.String"

    const-string v5, "data"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x8c

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_5:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "logout"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxBridge"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x9e

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_6:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "showLoader"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxBridge"

    const-string v4, "boolean"

    const-string v5, "shouldShow"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xa7

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_7:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "showCloseShouldPreventBackButtonAction"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxBridge"

    const-string v4, "boolean:boolean"

    const-string v5, "showCloseButton:stopCloseEvent"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xad

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_8:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "close"

    const-string v3, "com.disney.id.android.lightboxinteraction.DIDLightBoxBridge"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xb3

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_9:Lorg/aspectj/lang/JoinPoint$StaticPart;

    return-void
.end method

.method private static final bridgeReady_aroundBody4(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    .prologue
    .line 95
    const-string v0, "PRELOAD_INFO"

    const-string v1, "bridgeReady() called"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "bridgeReady() called."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->isReady:Z

    .line 98
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->coordination:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;

    invoke-interface {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;->bridgeReady()V

    .line 99
    return-void
.end method

.method private static final bridgeReady_aroundBody5$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->bridgeReady_aroundBody4(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final clearData_aroundBody10(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V
    .locals 5
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 140
    const-string v2, "PRELOAD_INFO"

    const-string v3, "clearData() called"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->TAG:Ljava/lang/String;

    invoke-static {v2}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "clearData() called."

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    :try_start_0
    new-instance v1, Lcom/disney/id/android/localdata/DIDLocalData;

    invoke-direct {v1, p1}, Lcom/disney/id/android/localdata/DIDLocalData;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException; {:try_start_0 .. :try_end_0} :catch_0

    .line 149
    .local v1, "localData":Lcom/disney/id/android/localdata/DIDLocalData;
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->mLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    invoke-virtual {v2, v1}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->clearData(Lcom/disney/id/android/localdata/DIDLocalData;)V

    .line 150
    invoke-virtual {v1}, Lcom/disney/id/android/localdata/DIDLocalData;->hasCallback()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 151
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->webCommunication:Lcom/disney/id/android/lightboxinteraction/DIDWebCommunication;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "didNativeToWeb[\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/disney/id/android/localdata/DIDLocalData;->getCallback()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\"]()"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/disney/id/android/lightboxinteraction/DIDWebCommunication;->loadJS(Ljava/lang/String;)V

    .line 153
    .end local v1    # "localData":Lcom/disney/id/android/localdata/DIDLocalData;
    :cond_0
    :goto_0
    return-void

    .line 145
    :catch_0
    move-exception v0

    .line 146
    .local v0, "e":Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException;
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->TAG:Ljava/lang/String;

    invoke-static {v2}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static final clearData_aroundBody11$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p1, "data"    # Ljava/lang/String;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->clearData_aroundBody10(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final close_aroundBody18(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;)V
    .locals 1
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    .prologue
    .line 179
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->coordination:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;

    invoke-interface {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;->close()V

    .line 180
    return-void
.end method

.method private static final close_aroundBody19$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->close_aroundBody18(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final createSuccess_aroundBody24(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;)V
    .locals 1
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    .prologue
    .line 208
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->isHandlingSocialInteraction:Z

    .line 209
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->coordination:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;

    invoke-interface {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;->createSuccess()V

    .line 210
    return-void
.end method

.method private static final createSuccess_aroundBody25$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->createSuccess_aroundBody24(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final externalLogin_aroundBody28(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V
    .locals 1
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 221
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->isHandlingSocialInteraction:Z

    .line 223
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->coordination:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;

    invoke-interface {v0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;->externalLogin(Ljava/lang/String;)V

    .line 224
    return-void
.end method

.method private static final externalLogin_aroundBody29$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p1, "data"    # Ljava/lang/String;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->externalLogin_aroundBody28(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final getData_aroundBody8(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V
    .locals 5
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 122
    const-string v2, "PRELOAD_INFO"

    const-string v3, "getData() called"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->TAG:Ljava/lang/String;

    invoke-static {v2}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "getData() called."

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    :try_start_0
    new-instance v1, Lcom/disney/id/android/localdata/DIDLocalData;

    invoke-direct {v1, p1}, Lcom/disney/id/android/localdata/DIDLocalData;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException; {:try_start_0 .. :try_end_0} :catch_0

    .line 131
    .local v1, "localData":Lcom/disney/id/android/localdata/DIDLocalData;
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->mLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    invoke-virtual {v2, v1}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->getData(Lcom/disney/id/android/localdata/DIDLocalData;)Lcom/disney/id/android/localdata/DIDLocalData;

    move-result-object v1

    .line 132
    invoke-virtual {v1}, Lcom/disney/id/android/localdata/DIDLocalData;->hasCallback()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 133
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->webCommunication:Lcom/disney/id/android/lightboxinteraction/DIDWebCommunication;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "didNativeToWeb[\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/disney/id/android/localdata/DIDLocalData;->getCallback()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\"]("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/disney/id/android/localdata/DIDLocalData;->formatResponse()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/disney/id/android/lightboxinteraction/DIDWebCommunication;->loadJS(Ljava/lang/String;)V

    .line 135
    .end local v1    # "localData":Lcom/disney/id/android/localdata/DIDLocalData;
    :cond_0
    :goto_0
    return-void

    .line 127
    :catch_0
    move-exception v0

    .line 128
    .local v0, "e":Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException;
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->TAG:Ljava/lang/String;

    invoke-static {v2}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static final getData_aroundBody9$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p1, "data"    # Ljava/lang/String;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->getData_aroundBody8(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final loginSuccess_aroundBody20(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;)V
    .locals 1
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    .prologue
    .line 185
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->isHandlingSocialInteraction:Z

    .line 187
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->coordination:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;

    invoke-interface {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;->loginSuccess()V

    .line 188
    return-void
.end method

.method private static final loginSuccess_aroundBody21$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->loginSuccess_aroundBody20(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final logout_aroundBody12(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    .prologue
    .line 158
    const-string v0, "PRELOAD_INFO"

    const-string v1, "logout() called over the bridge"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "logout() called."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->coordination:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;

    invoke-interface {v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;->handleLogout()V

    .line 162
    return-void
.end method

.method private static final logout_aroundBody13$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->logout_aroundBody12(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final optInSuccess_aroundBody34(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V
    .locals 1
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p1, "newsletters"    # Ljava/lang/String;

    .prologue
    .line 241
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->coordination:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;

    invoke-interface {v0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;->optInSuccess(Ljava/lang/String;)V

    .line 242
    return-void
.end method

.method private static final optInSuccess_aroundBody35$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p1, "newsletters"    # Ljava/lang/String;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->optInSuccess_aroundBody34(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final reauthSuccess_aroundBody22(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;)V
    .locals 5
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    .prologue
    .line 193
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v0

    .line 194
    .local v0, "token":Lcom/disney/id/android/DIDToken;
    invoke-virtual {v0}, Lcom/disney/id/android/DIDToken;->newHighTrust()V

    .line 196
    :try_start_0
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "token"

    invoke-virtual {v0}, Lcom/disney/id/android/DIDToken;->getTokenJSON()Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/disney/id/android/DIDGuest;->update(Lorg/json/JSONObject;)V

    .line 198
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->mLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v2

    invoke-virtual {v2}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->setGuestData(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/disney/id/android/DIDGuest$GuestException; {:try_start_0 .. :try_end_0} :catch_1

    .line 202
    :goto_0
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->coordination:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;

    invoke-interface {v1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;->reauthSuccess()V

    .line 203
    return-void

    .line 199
    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method private static final reauthSuccess_aroundBody23$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->reauthSuccess_aroundBody22(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final requestClose_aroundBody2(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->webCommunication:Lcom/disney/id/android/lightboxinteraction/DIDWebCommunication;

    const-string v1, "didNativeToWeb.requestClose()"

    invoke-interface {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebCommunication;->loadJS(Ljava/lang/String;)V

    .line 72
    return-void
.end method

.method private static final requestClose_aroundBody3$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->requestClose_aroundBody2(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final sendLogs_aroundBody30(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V
    .locals 3
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 229
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sendLogs() called.: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    return-void
.end method

.method private static final sendLogs_aroundBody31$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p1, "data"    # Ljava/lang/String;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->sendLogs_aroundBody30(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final sendMetrics_aroundBody32(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V
    .locals 1
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 235
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->coordination:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;

    invoke-interface {v0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;->sendMetrics(Ljava/lang/String;)V

    .line 236
    return-void
.end method

.method private static final sendMetrics_aroundBody33$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p1, "data"    # Ljava/lang/String;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->sendMetrics_aroundBody32(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final setData_aroundBody6(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V
    .locals 5
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 104
    const-string v2, "PRELOAD_INFO"

    const-string v3, "setData() called"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->TAG:Ljava/lang/String;

    invoke-static {v2}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "setData() called."

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    :try_start_0
    new-instance v1, Lcom/disney/id/android/localdata/DIDLocalData;

    invoke-direct {v1, p1}, Lcom/disney/id/android/localdata/DIDLocalData;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    .local v1, "localData":Lcom/disney/id/android/localdata/DIDLocalData;
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->mLocalDataHandler:Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    invoke-virtual {v2, v1}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->setData(Lcom/disney/id/android/localdata/DIDLocalData;)V

    .line 114
    invoke-virtual {v1}, Lcom/disney/id/android/localdata/DIDLocalData;->hasCallback()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 115
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->webCommunication:Lcom/disney/id/android/lightboxinteraction/DIDWebCommunication;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "didNativeToWeb[\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/disney/id/android/localdata/DIDLocalData;->getCallback()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\"]()"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/disney/id/android/lightboxinteraction/DIDWebCommunication;->loadJS(Ljava/lang/String;)V

    .line 117
    .end local v1    # "localData":Lcom/disney/id/android/localdata/DIDLocalData;
    :cond_0
    :goto_0
    return-void

    .line 109
    :catch_0
    move-exception v0

    .line 110
    .local v0, "e":Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException;
    iget-object v2, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->TAG:Ljava/lang/String;

    invoke-static {v2}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/disney/id/android/localdata/DIDLocalData$LocalDataException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static final setData_aroundBody7$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p1, "data"    # Ljava/lang/String;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->setData_aroundBody6(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final showCloseShouldPreventBackButtonAction_aroundBody16(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;ZZLorg/aspectj/lang/JoinPoint;)V
    .locals 1
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p1, "showCloseButton"    # Z
    .param p2, "stopCloseEvent"    # Z

    .prologue
    .line 173
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->coordination:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;

    invoke-interface {v0, p1, p2}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;->setCloseBehavior(ZZ)V

    .line 174
    return-void
.end method

.method private static final showCloseShouldPreventBackButtonAction_aroundBody17$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;ZZLorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
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
    invoke-static {p0, p1, p2, p5}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->showCloseShouldPreventBackButtonAction_aroundBody16(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;ZZLorg/aspectj/lang/JoinPoint;)V

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

.method private static final showLoader_aroundBody14(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;ZLorg/aspectj/lang/JoinPoint;)V
    .locals 1
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p1, "shouldShow"    # Z

    .prologue
    .line 167
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->coordination:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;

    invoke-interface {v0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;->showLoader(Z)V

    .line 168
    return-void
.end method

.method private static final showLoader_aroundBody15$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;ZLorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p1, "shouldShow"    # Z
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->showLoader_aroundBody14(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;ZLorg/aspectj/lang/JoinPoint;)V

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

.method private static final showPage_aroundBody0(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V
    .locals 4
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p1, "pageName"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;
    .param p2, "data"    # Ljava/lang/String;

    .prologue
    .line 57
    const-string v1, "PRELOAD_INFO"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "showPage(\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\") called"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .local v0, "jsBuilder":Ljava/lang/StringBuilder;
    const-string v1, "didNativeToWeb"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".showPage(\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x27

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 61
    invoke-static {p2}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 62
    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    :cond_0
    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->webCommunication:Lcom/disney/id/android/lightboxinteraction/DIDWebCommunication;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/disney/id/android/lightboxinteraction/DIDWebCommunication;->loadJS(Ljava/lang/String;)V

    .line 67
    return-void
.end method

.method private static final showPage_aroundBody1$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p1, "pageName"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;
    .param p2, "data"    # Ljava/lang/String;
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
    invoke-static {p0, p1, p2, p5}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->showPage_aroundBody0(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final updateSuccess_aroundBody26(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V
    .locals 1
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p1, "delta"    # Ljava/lang/String;

    .prologue
    .line 215
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->coordination:Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;

    invoke-interface {v0, p1}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge$Coordination;->updateSuccess(Ljava/lang/String;)V

    .line 216
    return-void
.end method

.method private static final updateSuccess_aroundBody27$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;
    .param p1, "delta"    # Ljava/lang/String;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->updateSuccess_aroundBody26(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V

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
.method bridgeInject()V
    .locals 2

    .prologue
    .line 81
    invoke-virtual {p0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->isReady()Z

    move-result v0

    if-nez v0, :cond_0

    .line 82
    const-string v0, "PRELOAD_INFO"

    const-string v1, "bridgeInject() called"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "bridgeInject() called."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    iget-object v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->webCommunication:Lcom/disney/id/android/lightboxinteraction/DIDWebCommunication;

    const-string v1, "window.notifyBridgeInjected()"

    invoke-interface {v0, v1}, Lcom/disney/id/android/lightboxinteraction/DIDWebCommunication;->loadJS(Ljava/lang/String;)V

    .line 86
    :cond_0
    return-void
.end method

.method public bridgeReady()V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->bridgeReady_aroundBody5$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public clearData(Ljava/lang/String;)V
    .locals 3
    .param p1, "data"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_5:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->clearData_aroundBody11$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public close()V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_9:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->close_aroundBody19$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public createSuccess()V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_12:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->createSuccess_aroundBody25$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public externalLogin(Ljava/lang/String;)V
    .locals 3
    .param p1, "data"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_14:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->externalLogin_aroundBody29$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public getData(Ljava/lang/String;)V
    .locals 3
    .param p1, "data"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_4:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->getData_aroundBody9$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method handleSocialSynchronization()V
    .locals 1

    .prologue
    .line 255
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->isHandlingSocialInteraction:Z

    .line 256
    return-void
.end method

.method isHandlingSocialInteraction()Z
    .locals 1

    .prologue
    .line 259
    iget-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->isHandlingSocialInteraction:Z

    return v0
.end method

.method isReady()Z
    .locals 1

    .prologue
    .line 251
    iget-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->isReady:Z

    return v0
.end method

.method public loginSuccess()V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_10:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->loginSuccess_aroundBody21$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public logout()V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_6:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->logout_aroundBody13$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public optInSuccess(Ljava/lang/String;)V
    .locals 3
    .param p1, "newsletters"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_17:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->optInSuccess_aroundBody35$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method prepareToDisplayNextPage()V
    .locals 1

    .prologue
    .line 245
    iget-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->isHandlingSocialInteraction:Z

    if-eqz v0, :cond_0

    .line 246
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->isHandlingSocialInteraction:Z

    .line 248
    :cond_0
    return-void
.end method

.method public reauthSuccess()V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_11:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->reauthSuccess_aroundBody23$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method requestClose()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->requestClose_aroundBody3$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method resetBridge()V
    .locals 1

    .prologue
    .line 89
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->isReady:Z

    .line 90
    return-void
.end method

.method public sendLogs(Ljava/lang/String;)V
    .locals 3
    .param p1, "data"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_15:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->sendLogs_aroundBody31$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public sendMetrics(Ljava/lang/String;)V
    .locals 3
    .param p1, "data"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_16:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->sendMetrics_aroundBody33$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public setData(Ljava/lang/String;)V
    .locals 3
    .param p1, "data"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_3:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->setData_aroundBody7$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method setWebCommunication(Lcom/disney/id/android/lightboxinteraction/DIDWebCommunication;)V
    .locals 0
    .param p1, "webCommunication"    # Lcom/disney/id/android/lightboxinteraction/DIDWebCommunication;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->webCommunication:Lcom/disney/id/android/lightboxinteraction/DIDWebCommunication;

    .line 49
    return-void
.end method

.method public showCloseShouldPreventBackButtonAction(ZZ)V
    .locals 6
    .param p1, "showCloseButton"    # Z
    .param p2, "stopCloseEvent"    # Z
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_8:Lorg/aspectj/lang/JoinPoint$StaticPart;

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

    invoke-static/range {v0 .. v5}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->showCloseShouldPreventBackButtonAction_aroundBody17$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;ZZLorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public showLoader(Z)V
    .locals 3
    .param p1, "shouldShow"    # Z
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_7:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {p1}, Lorg/aspectj/runtime/internal/Conversions;->booleanObject(Z)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, p0, p0, v1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->showLoader_aroundBody15$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;ZLorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method showPage(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;)V
    .locals 1
    .param p1, "pageName"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;

    .prologue
    .line 52
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->showPage(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;Ljava/lang/String;)V

    .line 53
    return-void
.end method

.method showPage(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;Ljava/lang/String;)V
    .locals 6
    .param p1, "pageName"    # Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;
    .param p2, "data"    # Ljava/lang/String;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1, p2}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v3

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v4

    move-object v5, v3

    check-cast v5, Lorg/aspectj/lang/ProceedingJoinPoint;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-static/range {v0 .. v5}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->showPage_aroundBody1$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Lcom/disney/id/android/lightboxinteraction/DIDLightBoxPageName;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method sync()V
    .locals 3

    .prologue
    .line 75
    const-string v0, "didNativeToWeb.sync();"

    .line 76
    .local v0, "js":Ljava/lang/String;
    const-string v1, "PRELOAD_INFO"

    const-string v2, "didNativeToWeb.sync(); called"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    iget-object v1, p0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->webCommunication:Lcom/disney/id/android/lightboxinteraction/DIDWebCommunication;

    const-string v2, "didNativeToWeb.sync();"

    invoke-interface {v1, v2}, Lcom/disney/id/android/lightboxinteraction/DIDWebCommunication;->loadJS(Ljava/lang/String;)V

    .line 78
    return-void
.end method

.method public updateSuccess(Ljava/lang/String;)V
    .locals 3
    .param p1, "delta"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->ajc$tjp_13:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;->updateSuccess_aroundBody27$advice(Lcom/disney/id/android/lightboxinteraction/DIDLightBoxBridge;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method
