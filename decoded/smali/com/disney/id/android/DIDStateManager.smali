.class public Lcom/disney/id/android/DIDStateManager;
.super Ljava/lang/Object;
.source "DIDStateManager.java"

# interfaces
.implements Lcom/disney/id/android/log/DIDEventParams;


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static final ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_10:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_11:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_12:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_13:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_3:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_4:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_5:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_6:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_7:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_8:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_9:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static instance:Lcom/disney/id/android/DIDStateManager;


# instance fields
.field private appInstanceId:Ljava/lang/String;

.field private conversationId:Ljava/lang/String;

.field private conversationIdTimeStamp:Ljava/lang/Long;

.field private correlationId:Ljava/lang/String;

.field private currentEndCode:Ljava/lang/String;

.field private currentEvent:Ljava/lang/String;

.field private currentStateParam:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private logger:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

.field private serviceEndCode:Ljava/lang/String;

.field private serviceStartCode:Ljava/lang/String;

.field private swid:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    invoke-static {}, Lcom/disney/id/android/DIDStateManager;->ajc$preClinit()V

    .line 24
    const-class v0, Lcom/disney/id/android/DIDStateManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDStateManager;->TAG:Ljava/lang/String;

    .line 26
    const/4 v0, 0x0

    sput-object v0, Lcom/disney/id/android/DIDStateManager;->instance:Lcom/disney/id/android/DIDStateManager;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    .line 52
    const-string v0, "event.unknown"

    iput-object v0, p0, Lcom/disney/id/android/DIDStateManager;->currentEvent:Ljava/lang/String;

    .line 53
    const-string v0, "event.end.unknown"

    iput-object v0, p0, Lcom/disney/id/android/DIDStateManager;->currentEndCode:Ljava/lang/String;

    .line 55
    const-string v0, "event.service.unknown"

    iput-object v0, p0, Lcom/disney/id/android/DIDStateManager;->serviceStartCode:Ljava/lang/String;

    .line 56
    const-string v0, "event.service.unknown"

    iput-object v0, p0, Lcom/disney/id/android/DIDStateManager;->serviceEndCode:Ljava/lang/String;

    .line 29
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->getInstance(Landroid/content/Context;)Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/DIDStateManager;->logger:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    .line 30
    return-void
.end method

.method private static ajc$preClinit()V
    .locals 9

    .prologue
    .line 1
    new-instance v0, Lorg/aspectj/runtime/reflect/Factory;

    const-string v1, "DIDStateManager.java"

    const-class v2, Lcom/disney/id/android/DIDStateManager;

    invoke-direct {v0, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "trackInit"

    const-string v3, "com.disney.id.android.DIDStateManager"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x4e

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "trackDispatchEvent"

    const-string v3, "com.disney.id.android.DIDStateManager"

    const-string v4, "java.lang.String"

    const-string v5, "data"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x58

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "trackServiceEnd"

    const-string v3, "com.disney.id.android.DIDStateManager"

    const-string v4, "java.lang.String:long:boolean"

    const-string v5, "actionCode:startTime:success"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xb4

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_10:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "trackServiceEnd"

    const-string v3, "com.disney.id.android.DIDStateManager"

    const-string v4, "java.lang.String:long:boolean:java.lang.String:java.lang.String"

    const-string v5, "actionCode:startTime:success:errorCode:errorCategory"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xbf

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_11:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "trackServiceEnd"

    const-string v3, "com.disney.id.android.DIDStateManager"

    const-string v4, "java.lang.String:java.util.Map"

    const-string v5, "actionCode:context"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xe2

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_12:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "tallyLoggedInState"

    const-string v3, "com.disney.id.android.DIDStateManager"

    const-string v4, "java.lang.Boolean"

    const-string v5, "isLoggedIn"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xf2

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_13:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "markServiceCallStart"

    const-string v3, "com.disney.id.android.DIDStateManager"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x7b

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "trackLaunchActionStart"

    const-string v3, "com.disney.id.android.DIDStateManager"

    const-string v4, "java.lang.String"

    const-string v5, "actionCode"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x81

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_3:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "trackLaunchActionStart"

    const-string v3, "com.disney.id.android.DIDStateManager"

    const-string v4, "java.lang.String:java.lang.String"

    const-string v5, "actionCode:endCode"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x89

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_4:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "trackLaunchActionEnd"

    const-string v3, "com.disney.id.android.DIDStateManager"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x92

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_5:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "trackLaunchActionEnd"

    const-string v3, "com.disney.id.android.DIDStateManager"

    const-string v4, "java.lang.String"

    const-string v5, "actionCode"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x97

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_6:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "trackServiceStart"

    const-string v3, "com.disney.id.android.DIDStateManager"

    const-string v4, "java.lang.String:java.lang.String"

    const-string v5, "actionCode:endCode"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x9d

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_7:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "trackServiceEnd"

    const-string v3, "com.disney.id.android.DIDStateManager"

    const-string v4, ""

    const-string v5, ""

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xa8

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_8:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "trackServiceEnd"

    const-string v3, "com.disney.id.android.DIDStateManager"

    const-string v4, "java.lang.String"

    const-string v5, "actionCode"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xae

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_9:Lorg/aspectj/lang/JoinPoint$StaticPart;

    return-void
.end method

.method private generateAppInstanceId()V
    .locals 3

    .prologue
    .line 72
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/DIDStateManager;->appInstanceId:Ljava/lang/String;

    .line 73
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    const-string v1, "mobile_launch_id"

    iget-object v2, p0, Lcom/disney/id/android/DIDStateManager;->appInstanceId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    return-void
.end method

.method private generateNewConversationId()V
    .locals 3

    .prologue
    .line 60
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/DIDStateManager;->conversationId:Ljava/lang/String;

    .line 61
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/DIDStateManager;->conversationIdTimeStamp:Ljava/lang/Long;

    .line 62
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    const-string v1, "conversation_id"

    iget-object v2, p0, Lcom/disney/id/android/DIDStateManager;->conversationId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    const-string v1, "conversationIdTimeStamp"

    iget-object v2, p0, Lcom/disney/id/android/DIDStateManager;->conversationIdTimeStamp:Ljava/lang/Long;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    return-void
.end method

.method private generateNewCorrelationId()V
    .locals 3

    .prologue
    .line 67
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/DIDStateManager;->correlationId:Ljava/lang/String;

    .line 68
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    const-string v1, "correlation_id"

    iget-object v2, p0, Lcom/disney/id/android/DIDStateManager;->correlationId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/disney/id/android/DIDStateManager;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    sget-object v0, Lcom/disney/id/android/DIDStateManager;->instance:Lcom/disney/id/android/DIDStateManager;

    if-nez v0, :cond_0

    .line 34
    new-instance v0, Lcom/disney/id/android/DIDStateManager;

    invoke-direct {v0, p0}, Lcom/disney/id/android/DIDStateManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/disney/id/android/DIDStateManager;->instance:Lcom/disney/id/android/DIDStateManager;

    .line 37
    :cond_0
    sget-object v0, Lcom/disney/id/android/DIDStateManager;->instance:Lcom/disney/id/android/DIDStateManager;

    return-object v0
.end method

.method private static final markServiceCallStart_aroundBody4(Lcom/disney/id/android/DIDStateManager;Lorg/aspectj/lang/JoinPoint;)V
    .locals 0
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;

    .prologue
    .line 123
    invoke-direct {p0}, Lcom/disney/id/android/DIDStateManager;->generateNewConversationId()V

    .line 124
    invoke-direct {p0}, Lcom/disney/id/android/DIDStateManager;->generateNewCorrelationId()V

    .line 125
    return-void
.end method

.method private static final markServiceCallStart_aroundBody5$advice(Lcom/disney/id/android/DIDStateManager;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/DIDStateManager;->markServiceCallStart_aroundBody4(Lcom/disney/id/android/DIDStateManager;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final tallyLoggedInState_aroundBody26(Lcom/disney/id/android/DIDStateManager;Ljava/lang/Boolean;Lorg/aspectj/lang/JoinPoint;)V
    .locals 3
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
    .param p1, "isLoggedIn"    # Ljava/lang/Boolean;

    .prologue
    .line 242
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 243
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    const-string v1, "anon"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    const-string v1, "swid"

    iget-object v2, p0, Lcom/disney/id/android/DIDStateManager;->swid:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    :goto_0
    return-void

    .line 246
    :cond_0
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/DIDStateManager;->swid:Ljava/lang/String;

    .line 248
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    const-string v1, "anon"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    const-string v1, "swid"

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    const-string v1, "swid"

    iget-object v2, p0, Lcom/disney/id/android/DIDStateManager;->swid:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private static final tallyLoggedInState_aroundBody27$advice(Lcom/disney/id/android/DIDStateManager;Ljava/lang/Boolean;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
    .param p1, "isLoggedIn"    # Ljava/lang/Boolean;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/DIDStateManager;->tallyLoggedInState_aroundBody26(Lcom/disney/id/android/DIDStateManager;Ljava/lang/Boolean;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final trackDispatchEvent_aroundBody2(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V
    .locals 9
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 88
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 89
    .local v3, "json":Lorg/json/JSONObject;
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 91
    .local v5, "parameters":Ljava/util/Map;
    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 92
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 93
    .local v4, "key":Ljava/lang/String;
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v5, v4, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 115
    .end local v2    # "it":Ljava/util/Iterator;
    .end local v3    # "json":Lorg/json/JSONObject;
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "parameters":Ljava/util/Map;
    :catch_0
    move-exception v1

    .line 116
    .local v1, "e":Ljava/lang/Exception;
    sget-object v7, Lcom/disney/id/android/DIDStateManager;->TAG:Ljava/lang/String;

    invoke-static {v7}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "Error while parsing sendLogs data"

    invoke-static {v7, v8, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 118
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1
    return-void

    .line 95
    .restart local v2    # "it":Ljava/util/Iterator;
    .restart local v3    # "json":Lorg/json/JSONObject;
    .restart local v5    # "parameters":Ljava/util/Map;
    :cond_0
    :try_start_1
    const-string v7, "swid"

    invoke-interface {v5, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 96
    const-string v7, "swid"

    invoke-interface {v5, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 97
    .local v6, "swid":Ljava/lang/Object;
    if-eqz v6, :cond_1

    sget-object v7, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {v7, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 98
    check-cast v6, Ljava/lang/String;

    .end local v6    # "swid":Ljava/lang/Object;
    invoke-virtual {p0, v6}, Lcom/disney/id/android/DIDStateManager;->trackSwid(Ljava/lang/String;)V

    .line 102
    :cond_1
    const-string v7, "sdk_version"

    invoke-interface {v5, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 103
    const-string v7, "sdk_version"

    invoke-interface {v5, v7}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    :cond_2
    const-string v7, "conversation_id"

    invoke-interface {v5, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 108
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 109
    .local v0, "conversationOverride":Ljava/util/Map;
    const-string v7, "conversation_id"

    const-string v8, "conversation_id"

    invoke-interface {v5, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v0, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    iget-object v7, p0, Lcom/disney/id/android/DIDStateManager;->logger:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    iget-object v8, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    invoke-virtual {v7, v5, v8, v0}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->logDispatchEvent(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V

    goto :goto_1

    .line 112
    .end local v0    # "conversationOverride":Ljava/util/Map;
    :cond_3
    iget-object v7, p0, Lcom/disney/id/android/DIDStateManager;->logger:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    iget-object v8, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    invoke-virtual {v7, v5, v8}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->logDispatchEvent(Ljava/util/Map;Ljava/util/Map;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method private static final trackDispatchEvent_aroundBody3$advice(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/DIDStateManager;->trackDispatchEvent_aroundBody2(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final trackInit_aroundBody0(Lcom/disney/id/android/DIDStateManager;Lorg/aspectj/lang/JoinPoint;)V
    .locals 3
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;

    .prologue
    .line 78
    sget-object v0, Lcom/disney/id/android/DIDStateManager;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "TrackInit"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    invoke-direct {p0}, Lcom/disney/id/android/DIDStateManager;->generateAppInstanceId()V

    .line 80
    iget-object v1, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    const-string v2, "anon"

    invoke-virtual {p0}, Lcom/disney/id/android/DIDStateManager;->isLoggedIn()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->logger:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    iget-object v1, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    invoke-virtual {v0, v1}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->start(Ljava/util/Map;)V

    .line 83
    return-void

    .line 80
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static final trackInit_aroundBody1$advice(Lcom/disney/id/android/DIDStateManager;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/DIDStateManager;->trackInit_aroundBody0(Lcom/disney/id/android/DIDStateManager;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final trackLaunchActionEnd_aroundBody10(Lcom/disney/id/android/DIDStateManager;Lorg/aspectj/lang/JoinPoint;)V
    .locals 3
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;

    .prologue
    .line 146
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->logger:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    iget-object v1, p0, Lcom/disney/id/android/DIDStateManager;->currentEndCode:Ljava/lang/String;

    iget-object v2, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    invoke-virtual {v0, v1, v2}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->logStandardEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 147
    return-void
.end method

.method private static final trackLaunchActionEnd_aroundBody11$advice(Lcom/disney/id/android/DIDStateManager;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/DIDStateManager;->trackLaunchActionEnd_aroundBody10(Lcom/disney/id/android/DIDStateManager;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final trackLaunchActionEnd_aroundBody12(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
    .param p1, "actionCode"    # Ljava/lang/String;

    .prologue
    .line 151
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->logger:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    iget-object v1, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    invoke-virtual {v0, p1, v1}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->logStandardEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 152
    return-void
.end method

.method private static final trackLaunchActionEnd_aroundBody13$advice(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
    .param p1, "actionCode"    # Ljava/lang/String;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/DIDStateManager;->trackLaunchActionEnd_aroundBody12(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final trackLaunchActionStart_aroundBody6(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
    .param p1, "actionCode"    # Ljava/lang/String;

    .prologue
    .line 129
    invoke-direct {p0}, Lcom/disney/id/android/DIDStateManager;->generateNewConversationId()V

    .line 130
    invoke-direct {p0}, Lcom/disney/id/android/DIDStateManager;->generateNewCorrelationId()V

    .line 131
    iput-object p1, p0, Lcom/disney/id/android/DIDStateManager;->currentEvent:Ljava/lang/String;

    .line 132
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->logger:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    iget-object v1, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    invoke-virtual {v0, p1, v1}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->logStandardEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 133
    return-void
.end method

.method private static final trackLaunchActionStart_aroundBody7$advice(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
    .param p1, "actionCode"    # Ljava/lang/String;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/DIDStateManager;->trackLaunchActionStart_aroundBody6(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final trackLaunchActionStart_aroundBody8(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
    .param p1, "actionCode"    # Ljava/lang/String;
    .param p2, "endCode"    # Ljava/lang/String;

    .prologue
    .line 137
    invoke-direct {p0}, Lcom/disney/id/android/DIDStateManager;->generateNewConversationId()V

    .line 138
    invoke-direct {p0}, Lcom/disney/id/android/DIDStateManager;->generateNewCorrelationId()V

    .line 139
    iput-object p1, p0, Lcom/disney/id/android/DIDStateManager;->currentEvent:Ljava/lang/String;

    .line 140
    iput-object p2, p0, Lcom/disney/id/android/DIDStateManager;->currentEndCode:Ljava/lang/String;

    .line 141
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->logger:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    iget-object v1, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    invoke-virtual {v0, p1, v1}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->logStandardEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 142
    return-void
.end method

.method private static final trackLaunchActionStart_aroundBody9$advice(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
    .param p1, "actionCode"    # Ljava/lang/String;
    .param p2, "endCode"    # Ljava/lang/String;
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
    invoke-static {p0, p1, p2, p5}, Lcom/disney/id/android/DIDStateManager;->trackLaunchActionStart_aroundBody8(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final trackServiceEnd_aroundBody16(Lcom/disney/id/android/DIDStateManager;Lorg/aspectj/lang/JoinPoint;)V
    .locals 3
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;

    .prologue
    .line 168
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->logger:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    iget-object v1, p0, Lcom/disney/id/android/DIDStateManager;->serviceEndCode:Ljava/lang/String;

    iget-object v2, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    invoke-virtual {v0, v1, v2}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->logStandardEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 169
    return-void
.end method

.method private static final trackServiceEnd_aroundBody17$advice(Lcom/disney/id/android/DIDStateManager;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
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
    invoke-static {p0, p3}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd_aroundBody16(Lcom/disney/id/android/DIDStateManager;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final trackServiceEnd_aroundBody18(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V
    .locals 2
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
    .param p1, "actionCode"    # Ljava/lang/String;

    .prologue
    .line 174
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->logger:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    iget-object v1, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    invoke-virtual {v0, p1, v1}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->logStandardEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 176
    return-void
.end method

.method private static final trackServiceEnd_aroundBody19$advice(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
    .param p1, "actionCode"    # Ljava/lang/String;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd_aroundBody18(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final trackServiceEnd_aroundBody20(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;JZLorg/aspectj/lang/JoinPoint;)V
    .locals 6
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
    .param p1, "actionCode"    # Ljava/lang/String;
    .param p2, "startTime"    # J
    .param p4, "success"    # Z

    .prologue
    .line 180
    new-instance v2, Ljava/util/TreeMap;

    iget-object v3, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    invoke-direct {v2, v3}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V

    .line 181
    .local v2, "params":Ljava/util/Map;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 182
    .local v0, "now":J
    const-string v3, "process_time"

    sub-long v4, v0, p2

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    const-string v3, "success"

    invoke-static {p4}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    iget-object v3, p0, Lcom/disney/id/android/DIDStateManager;->logger:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    invoke-virtual {v3, p1, v2}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->logStandardEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 187
    return-void
.end method

.method private static final trackServiceEnd_aroundBody21$advice(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;JZLorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 12
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
    .param p1, "actionCode"    # Ljava/lang/String;
    .param p2, "startTime"    # J
    .param p4, "success"    # Z
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

    move-wide v2, p2

    move/from16 v4, p4

    move-object/from16 v5, p7

    .line 42
    invoke-static/range {v0 .. v5}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd_aroundBody20(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;JZLorg/aspectj/lang/JoinPoint;)V

    const/4 v9, 0x0

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

.method private static final trackServiceEnd_aroundBody22(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V
    .locals 6
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
    .param p1, "actionCode"    # Ljava/lang/String;
    .param p2, "startTime"    # J
    .param p4, "success"    # Z
    .param p5, "errorCode"    # Ljava/lang/String;
    .param p6, "errorCategory"    # Ljava/lang/String;

    .prologue
    .line 191
    invoke-virtual {p0}, Lcom/disney/id/android/DIDStateManager;->isLoggedIn()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/disney/id/android/DIDStateManager;->tallyLoggedInState(Ljava/lang/Boolean;)V

    .line 193
    new-instance v2, Ljava/util/TreeMap;

    iget-object v3, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    invoke-direct {v2, v3}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V

    .line 194
    .local v2, "params":Ljava/util/Map;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 195
    .local v0, "now":J
    const-string v3, "process_time"

    sub-long v4, v0, p2

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    const-string v3, "success"

    invoke-static {p4}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    if-eqz p5, :cond_0

    .line 199
    const-string v3, "error_codes"

    invoke-interface {v2, v3, p5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    :cond_0
    if-eqz p6, :cond_1

    .line 203
    const-string v3, "error_category"

    invoke-interface {v2, v3, p6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    :cond_1
    iget-object v3, p0, Lcom/disney/id/android/DIDStateManager;->logger:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    invoke-virtual {v3, p1, v2}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->logStandardEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 209
    return-void
.end method

.method private static final trackServiceEnd_aroundBody23$advice(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 14
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
    .param p1, "actionCode"    # Ljava/lang/String;
    .param p2, "startTime"    # J
    .param p4, "success"    # Z
    .param p5, "errorCode"    # Ljava/lang/String;
    .param p6, "errorCategory"    # Ljava/lang/String;
    .param p7, "thisJoinPoint"    # Lorg/aspectj/lang/JoinPoint;
    .param p8, "ajc$aspectInstance"    # Lcom/disney/id/android/gintonic/aspect/TraceAspect;
    .param p9, "joinPoint"    # Lorg/aspectj/lang/ProceedingJoinPoint;

    .prologue
    .line 36
    invoke-interface/range {p9 .. p9}, Lorg/aspectj/lang/ProceedingJoinPoint;->getSignature()Lorg/aspectj/lang/Signature;

    move-result-object v10

    check-cast v10, Lorg/aspectj/lang/reflect/MethodSignature;

    .line 37
    .local v10, "methodSignature":Lorg/aspectj/lang/reflect/MethodSignature;
    invoke-interface {v10}, Lorg/aspectj/lang/reflect/MethodSignature;->getDeclaringType()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v8

    .line 38
    .local v8, "className":Ljava/lang/String;
    invoke-interface {v10}, Lorg/aspectj/lang/reflect/MethodSignature;->getName()Ljava/lang/String;

    move-result-object v9

    .line 40
    .local v9, "methodName":Ljava/lang/String;
    new-instance v12, Lcom/disney/id/android/gintonic/internal/StopWatch;

    invoke-direct {v12}, Lcom/disney/id/android/gintonic/internal/StopWatch;-><init>()V

    .line 41
    .local v12, "stopWatch":Lcom/disney/id/android/gintonic/internal/StopWatch;
    invoke-virtual {v12}, Lcom/disney/id/android/gintonic/internal/StopWatch;->start()V

    move-object v0, p0

    move-object v1, p1

    move-wide/from16 v2, p2

    move/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p9

    .line 42
    invoke-static/range {v0 .. v7}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd_aroundBody22(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V

    const/4 v11, 0x0

    .line 43
    .local v11, "result":Ljava/lang/Object;
    invoke-virtual {v12}, Lcom/disney/id/android/gintonic/internal/StopWatch;->stop()V

    .line 45
    invoke-virtual {v12}, Lcom/disney/id/android/gintonic/internal/StopWatch;->getTotalTimeMillis()J

    move-result-wide v0

    invoke-static {v9, v0, v1}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->ajc$inlineAccessMethod$com_disney_id_android_gintonic_aspect_TraceAspect$com_disney_id_android_gintonic_aspect_TraceAspect$buildLogMessage(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v0

    invoke-static {v8, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    return-object v11
.end method

.method private static final trackServiceEnd_aroundBody24(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Ljava/util/Map;Lorg/aspectj/lang/JoinPoint;)V
    .locals 1
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
    .param p1, "actionCode"    # Ljava/lang/String;
    .param p2, "context"    # Ljava/util/Map;

    .prologue
    .line 226
    if-nez p2, :cond_0

    .line 227
    new-instance p2, Ljava/util/HashMap;

    .end local p2    # "context":Ljava/util/Map;
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 229
    .restart local p2    # "context":Ljava/util/Map;
    :cond_0
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    invoke-interface {p2, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 230
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->logger:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    invoke-virtual {v0, p1, p2}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->logStandardEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 231
    return-void
.end method

.method private static final trackServiceEnd_aroundBody25$advice(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Ljava/util/Map;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
    .param p1, "actionCode"    # Ljava/lang/String;
    .param p2, "context"    # Ljava/util/Map;
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
    invoke-static {p0, p1, p2, p5}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd_aroundBody24(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Ljava/util/Map;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final trackServiceStart_aroundBody14(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V
    .locals 3
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
    .param p1, "actionCode"    # Ljava/lang/String;
    .param p2, "endCode"    # Ljava/lang/String;

    .prologue
    .line 157
    invoke-direct {p0}, Lcom/disney/id/android/DIDStateManager;->generateNewConversationId()V

    .line 158
    invoke-direct {p0}, Lcom/disney/id/android/DIDStateManager;->generateNewCorrelationId()V

    .line 160
    iput-object p1, p0, Lcom/disney/id/android/DIDStateManager;->serviceStartCode:Ljava/lang/String;

    .line 161
    iput-object p2, p0, Lcom/disney/id/android/DIDStateManager;->serviceEndCode:Ljava/lang/String;

    .line 162
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->logger:Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;

    iget-object v1, p0, Lcom/disney/id/android/DIDStateManager;->serviceStartCode:Ljava/lang/String;

    iget-object v2, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    invoke-virtual {v0, v1, v2}, Lcom/disney/id/android/log/DIDNewRelicInsightsLogger;->logStandardEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 164
    return-void
.end method

.method private static final trackServiceStart_aroundBody15$advice(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDStateManager;
    .param p1, "actionCode"    # Ljava/lang/String;
    .param p2, "endCode"    # Ljava/lang/String;
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
    invoke-static {p0, p1, p2, p5}, Lcom/disney/id/android/DIDStateManager;->trackServiceStart_aroundBody14(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V

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
.method public getCurrentSessionIds()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 284
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 286
    .local v0, "state":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/disney/id/android/DIDStateManager;->conversationId:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 287
    const-string v1, "CONVERSATION-ID"

    iget-object v2, p0, Lcom/disney/id/android/DIDStateManager;->conversationId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    :cond_0
    iget-object v1, p0, Lcom/disney/id/android/DIDStateManager;->correlationId:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 290
    const-string v1, "CORRELATION-ID"

    iget-object v2, p0, Lcom/disney/id/android/DIDStateManager;->correlationId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    :cond_1
    return-object v0
.end method

.method public getCurrentStateQueryParam()Ljava/lang/String;
    .locals 2

    .prologue
    .line 275
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->correlationId:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->conversationId:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 276
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "correlationId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/DIDStateManager;->correlationId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&conversationId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/DIDStateManager;->conversationId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&conversationIdTimeStamp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/DIDStateManager;->conversationIdTimeStamp:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 279
    :goto_0
    return-object v0

    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public isLoggedIn()Z
    .locals 6

    .prologue
    .line 212
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->hasGuest()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->hasToken()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->hasProfile()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDToken;->hasAccessToken()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDToken;->hasTTL()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDToken;->hasCreated()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDToken;->secondsUntilTokenExpiration()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_1

    const/4 v0, 0x1

    .line 220
    .local v0, "value":Z
    :goto_0
    if-eqz v0, :cond_0

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDGuest;->getToken()Lcom/disney/id/android/DIDToken;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disney/id/android/DIDToken;->getSWID()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/disney/id/android/DIDStateManager;->swid:Ljava/lang/String;

    .line 221
    :cond_0
    return v0

    .line 212
    .end local v0    # "value":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public markServiceCallStart()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_2:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/DIDStateManager;->markServiceCallStart_aroundBody5$advice(Lcom/disney/id/android/DIDStateManager;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public resetState()V
    .locals 1

    .prologue
    .line 235
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 236
    return-void
.end method

.method public tallyLoggedInState(Ljava/lang/Boolean;)V
    .locals 3
    .param p1, "isLoggedIn"    # Ljava/lang/Boolean;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_13:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/DIDStateManager;->tallyLoggedInState_aroundBody27$advice(Lcom/disney/id/android/DIDStateManager;Ljava/lang/Boolean;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public trackDispatchEvent(Ljava/lang/String;)V
    .locals 3
    .param p1, "data"    # Ljava/lang/String;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/DIDStateManager;->trackDispatchEvent_aroundBody3$advice(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public trackInit()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/DIDStateManager;->trackInit_aroundBody1$advice(Lcom/disney/id/android/DIDStateManager;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public trackLaunchActionEnd()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_5:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/DIDStateManager;->trackLaunchActionEnd_aroundBody11$advice(Lcom/disney/id/android/DIDStateManager;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public trackLaunchActionEnd(Ljava/lang/String;)V
    .locals 3
    .param p1, "actionCode"    # Ljava/lang/String;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_6:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/DIDStateManager;->trackLaunchActionEnd_aroundBody13$advice(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public trackLaunchActionStart(Ljava/lang/String;)V
    .locals 3
    .param p1, "actionCode"    # Ljava/lang/String;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_3:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/DIDStateManager;->trackLaunchActionStart_aroundBody7$advice(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public trackLaunchActionStart(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "actionCode"    # Ljava/lang/String;
    .param p2, "endCode"    # Ljava/lang/String;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_4:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1, p2}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v3

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v4

    move-object v5, v3

    check-cast v5, Lorg/aspectj/lang/ProceedingJoinPoint;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-static/range {v0 .. v5}, Lcom/disney/id/android/DIDStateManager;->trackLaunchActionStart_aroundBody9$advice(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public trackServiceEnd()V
    .locals 3
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_8:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, v1, v2, v0}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd_aroundBody17$advice(Lcom/disney/id/android/DIDStateManager;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public trackServiceEnd(Ljava/lang/String;)V
    .locals 3
    .param p1, "actionCode"    # Ljava/lang/String;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_9:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd_aroundBody19$advice(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public trackServiceEnd(Ljava/lang/String;JZ)V
    .locals 8
    .param p1, "actionCode"    # Ljava/lang/String;
    .param p2, "startTime"    # J
    .param p4, "success"    # Z
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_10:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    invoke-static {p2, p3}, Lorg/aspectj/runtime/internal/Conversions;->longObject(J)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p4}, Lorg/aspectj/runtime/internal/Conversions;->booleanObject(Z)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, p0, p0, v1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v5

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v6

    move-object v7, v5

    check-cast v7, Lorg/aspectj/lang/ProceedingJoinPoint;

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move v4, p4

    invoke-static/range {v0 .. v7}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd_aroundBody21$advice(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;JZLorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public trackServiceEnd(Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p1, "actionCode"    # Ljava/lang/String;
    .param p2, "startTime"    # J
    .param p4, "success"    # Z
    .param p5, "errorCode"    # Ljava/lang/String;
    .param p6, "errorCategory"    # Ljava/lang/String;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_11:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 v2, 0x1

    invoke-static {p2, p3}, Lorg/aspectj/runtime/internal/Conversions;->longObject(J)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p4}, Lorg/aspectj/runtime/internal/Conversions;->booleanObject(Z)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    aput-object p5, v1, v2

    const/4 v2, 0x4

    aput-object p6, v1, v2

    invoke-static {v0, p0, p0, v1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v7

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v8

    move-object v9, v7

    check-cast v9, Lorg/aspectj/lang/ProceedingJoinPoint;

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move v4, p4

    move-object v5, p5

    move-object/from16 v6, p6

    invoke-static/range {v0 .. v9}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd_aroundBody23$advice(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;JZLjava/lang/String;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public trackServiceEnd(Ljava/lang/String;Ljava/util/Map;)V
    .locals 6
    .param p1, "actionCode"    # Ljava/lang/String;
    .param p2, "context"    # Ljava/util/Map;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_12:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1, p2}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v3

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v4

    move-object v5, v3

    check-cast v5, Lorg/aspectj/lang/ProceedingJoinPoint;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-static/range {v0 .. v5}, Lcom/disney/id/android/DIDStateManager;->trackServiceEnd_aroundBody25$advice(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Ljava/util/Map;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public trackServiceStart(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "actionCode"    # Ljava/lang/String;
    .param p2, "endCode"    # Ljava/lang/String;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDStateManager;->ajc$tjp_7:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1, p2}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v3

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v4

    move-object v5, v3

    check-cast v5, Lorg/aspectj/lang/ProceedingJoinPoint;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-static/range {v0 .. v5}, Lcom/disney/id/android/DIDStateManager;->trackServiceStart_aroundBody15$advice(Lcom/disney/id/android/DIDStateManager;Ljava/lang/String;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public trackSwid(Ljava/lang/String;)V
    .locals 3
    .param p1, "swid"    # Ljava/lang/String;

    .prologue
    .line 265
    iput-object p1, p0, Lcom/disney/id/android/DIDStateManager;->swid:Ljava/lang/String;

    .line 266
    iget-object v0, p0, Lcom/disney/id/android/DIDStateManager;->currentStateParam:Ljava/util/Map;

    const-string v1, "swid"

    iget-object v2, p0, Lcom/disney/id/android/DIDStateManager;->swid:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    return-void
.end method

.method public trackTokenData(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 256
    .local p1, "token":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    const-string v1, "swid"

    invoke-interface {p1, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 257
    const-string v1, "swid"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 258
    .local v0, "token_swid":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/disney/id/android/DIDStateManager;->trackSwid(Ljava/lang/String;)V

    .line 262
    .end local v0    # "token_swid":Ljava/lang/String;
    :cond_0
    return-void
.end method
