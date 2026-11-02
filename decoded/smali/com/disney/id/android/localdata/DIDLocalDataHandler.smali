.class public Lcom/disney/id/android/localdata/DIDLocalDataHandler;
.super Ljava/lang/Object;
.source "DIDLocalDataHandler.java"


# static fields
.field static final DID_LOCAL_DATA_PREF:Ljava/lang/String; = "did_local_data"

.field static final PREF_PREFIX:Ljava/lang/String; = "did.session."

.field private static final TAG:Ljava/lang/String;

.field private static final ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

.field private static final ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;


# instance fields
.field private final mSharedPreferences:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    invoke-static {}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->ajc$preClinit()V

    .line 27
    const-class v0, Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    const-string v0, "did_local_data"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->mSharedPreferences:Landroid/content/SharedPreferences;

    .line 34
    return-void
.end method

.method private GUEST_DATA_KEY()Ljava/lang/String;
    .locals 2

    .prologue
    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/disney/id/android/DIDSessionConfig;->getClientId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "guest"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static ajc$preClinit()V
    .locals 9

    .prologue
    .line 1
    new-instance v0, Lorg/aspectj/runtime/reflect/Factory;

    const-string v1, "DIDLocalDataHandler.java"

    const-class v2, Lcom/disney/id/android/localdata/DIDLocalDataHandler;

    invoke-direct {v0, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "setData"

    const-string v3, "com.disney.id.android.localdata.DIDLocalDataHandler"

    const-string v4, "com.disney.id.android.localdata.DIDLocalData"

    const-string v5, "data"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x26

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v1

    sput-object v1, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "setGuestData"

    const-string v3, "com.disney.id.android.localdata.DIDLocalDataHandler"

    const-string v4, "java.lang.String"

    const-string v5, "guest"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0x77

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    return-void
.end method

.method private static final setData_aroundBody0(Lcom/disney/id/android/localdata/DIDLocalDataHandler;Lcom/disney/id/android/localdata/DIDLocalData;Lorg/aspectj/lang/JoinPoint;)V
    .locals 7
    .param p0, "ajc$this"    # Lcom/disney/id/android/localdata/DIDLocalDataHandler;
    .param p1, "data"    # Lcom/disney/id/android/localdata/DIDLocalData;

    .prologue
    .line 38
    sget-object v4, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->TAG:Ljava/lang/String;

    invoke-static {v4}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "setData() called."

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    invoke-virtual {p1}, Lcom/disney/id/android/localdata/DIDLocalData;->getData()Lorg/json/JSONObject;

    move-result-object v2

    .line 40
    .local v2, "json":Lorg/json/JSONObject;
    invoke-static {v2}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Lorg/json/JSONObject;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 41
    iget-object v4, p0, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 42
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 43
    .local v1, "iterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 44
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 46
    .local v3, "key":Ljava/lang/String;
    :try_start_0
    invoke-direct {p0}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->GUEST_DATA_KEY()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v4

    if-eqz v4, :cond_0

    .line 48
    :try_start_1
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v4

    new-instance v5, Lorg/json/JSONObject;

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Lcom/disney/id/android/DIDGuest;->update(Lorg/json/JSONObject;)V

    .line 49
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "did.session."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v5

    invoke-virtual {v5}, Lcom/disney/id/android/DIDGuest;->getGuestJSON()Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_1
    .catch Lcom/disney/id/android/DIDGuest$GuestException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 50
    :catch_0
    move-exception v4

    goto :goto_0

    .line 51
    :cond_0
    :try_start_2
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 52
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "did.session."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 56
    :catch_1
    move-exception v4

    goto :goto_0

    .line 54
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "did.session."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_0

    .line 58
    .end local v3    # "key":Ljava/lang/String;
    :cond_2
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 60
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v1    # "iterator":Ljava/util/Iterator;
    :cond_3
    return-void
.end method

.method private static final setData_aroundBody1$advice(Lcom/disney/id/android/localdata/DIDLocalDataHandler;Lcom/disney/id/android/localdata/DIDLocalData;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/localdata/DIDLocalDataHandler;
    .param p1, "data"    # Lcom/disney/id/android/localdata/DIDLocalData;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->setData_aroundBody0(Lcom/disney/id/android/localdata/DIDLocalDataHandler;Lcom/disney/id/android/localdata/DIDLocalData;Lorg/aspectj/lang/JoinPoint;)V

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

.method private static final setGuestData_aroundBody2(Lcom/disney/id/android/localdata/DIDLocalDataHandler;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V
    .locals 3
    .param p0, "ajc$this"    # Lcom/disney/id/android/localdata/DIDLocalDataHandler;
    .param p1, "guest"    # Ljava/lang/String;

    .prologue
    .line 119
    iget-object v1, p0, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 120
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-static {p1}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 121
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "did.session."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->GUEST_DATA_KEY()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 125
    :goto_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 126
    return-void

    .line 123
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "did.session."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->GUEST_DATA_KEY()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0
.end method

.method private static final setGuestData_aroundBody3$advice(Lcom/disney/id/android/localdata/DIDLocalDataHandler;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/localdata/DIDLocalDataHandler;
    .param p1, "guest"    # Ljava/lang/String;
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
    invoke-static {p0, p1, p4}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->setGuestData_aroundBody2(Lcom/disney/id/android/localdata/DIDLocalDataHandler;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;)V

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
.method public clearData(Lcom/disney/id/android/localdata/DIDLocalData;)V
    .locals 6
    .param p1, "data"    # Lcom/disney/id/android/localdata/DIDLocalData;

    .prologue
    .line 76
    sget-object v4, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->TAG:Ljava/lang/String;

    invoke-static {v4}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "clearData() called."

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    invoke-virtual {p1}, Lcom/disney/id/android/localdata/DIDLocalData;->getData()Lorg/json/JSONObject;

    move-result-object v2

    .line 78
    .local v2, "json":Lorg/json/JSONObject;
    invoke-static {v2}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Lorg/json/JSONObject;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 79
    iget-object v4, p0, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 80
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 81
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 82
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 83
    .local v3, "key":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "did.session."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 84
    invoke-direct {p0}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->GUEST_DATA_KEY()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 86
    :try_start_0
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/disney/id/android/DIDGuest;->update(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lcom/disney/id/android/DIDGuest$GuestException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 87
    :catch_0
    move-exception v4

    goto :goto_0

    .line 90
    .end local v3    # "key":Ljava/lang/String;
    :cond_1
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 92
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2
    return-void
.end method

.method public clearSessionData()V
    .locals 6

    .prologue
    .line 102
    iget-object v4, p0, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v3

    .line 103
    .local v3, "keys":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    .line 104
    iget-object v4, p0, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 105
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 106
    .local v2, "key":Ljava/lang/String;
    const-string v4, "did.session."

    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 107
    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 110
    .end local v2    # "key":Ljava/lang/String;
    :cond_1
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 112
    :try_start_0
    invoke-static {}, Lcom/disney/id/android/DIDGuest;->getInstance()Lcom/disney/id/android/DIDGuest;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/disney/id/android/DIDGuest;->update(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lcom/disney/id/android/DIDGuest$GuestException; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_2
    :goto_1
    return-void

    .line 113
    .restart local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    .restart local v1    # "i$":Ljava/util/Iterator;
    :catch_0
    move-exception v4

    goto :goto_1
.end method

.method public getData(Lcom/disney/id/android/localdata/DIDLocalData;)Lcom/disney/id/android/localdata/DIDLocalData;
    .locals 6
    .param p1, "data"    # Lcom/disney/id/android/localdata/DIDLocalData;

    .prologue
    .line 63
    sget-object v3, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->TAG:Ljava/lang/String;

    invoke-static {v3}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "getData() called."

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    invoke-virtual {p1}, Lcom/disney/id/android/localdata/DIDLocalData;->getData()Lorg/json/JSONObject;

    move-result-object v1

    .line 65
    .local v1, "json":Lorg/json/JSONObject;
    invoke-static {v1}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Lorg/json/JSONObject;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 66
    invoke-virtual {v1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    .line 67
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 68
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 69
    .local v2, "key":Ljava/lang/String;
    iget-object v3, p0, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->mSharedPreferences:Landroid/content/SharedPreferences;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "did.session."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, ""

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lcom/disney/id/android/localdata/DIDLocalData;->setData(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 72
    .end local v0    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v2    # "key":Ljava/lang/String;
    :cond_0
    return-object p1
.end method

.method public getGuestData()Lorg/json/JSONObject;
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 129
    iget-object v1, p0, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->mSharedPreferences:Landroid/content/SharedPreferences;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "did.session."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-direct {p0}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->GUEST_DATA_KEY()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 130
    .local v0, "guest":Ljava/lang/String;
    invoke-static {v0}, Lcom/disney/id/android/DIDUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 132
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 135
    :goto_0
    return-object v1

    .line 133
    :catch_0
    move-exception v1

    :cond_0
    move-object v1, v2

    .line 135
    goto :goto_0
.end method

.method public setData(Lcom/disney/id/android/localdata/DIDLocalData;)V
    .locals 3
    .param p1, "data"    # Lcom/disney/id/android/localdata/DIDLocalData;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->setData_aroundBody1$advice(Lcom/disney/id/android/localdata/DIDLocalDataHandler;Lcom/disney/id/android/localdata/DIDLocalData;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method

.method public setGuestData(Ljava/lang/String;)V
    .locals 3
    .param p1, "guest"    # Ljava/lang/String;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->ajc$tjp_1:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v1

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Lorg/aspectj/lang/ProceedingJoinPoint;

    invoke-static {p0, p1, v1, v2, v0}, Lcom/disney/id/android/localdata/DIDLocalDataHandler;->setGuestData_aroundBody3$advice(Lcom/disney/id/android/localdata/DIDLocalDataHandler;Ljava/lang/String;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method
