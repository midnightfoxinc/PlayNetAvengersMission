.class public Lcom/disney/id/android/gintonic/aspect/TraceAspect;
.super Ljava/lang/Object;
.source "TraceAspect.java"


# annotations
.annotation runtime Lorg/aspectj/lang/annotation/Aspect;
.end annotation


# static fields
.field private static final POINTCUT_CONSTRUCTOR:Ljava/lang/String; = "execution(@com.disney.id.android.gintonic.annotation.DIDTrace *.new(..))"

.field private static final POINTCUT_METHOD:Ljava/lang/String; = "execution(@com.disney.id.android.gintonic.annotation.DIDTrace * *(..))"

.field private static ajc$initFailureCause:Ljava/lang/Throwable;

.field public static final ajc$perSingletonInstance:Lcom/disney/id/android/gintonic/aspect/TraceAspect;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1
    nop

    :try_start_0
    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->ajc$postClinit()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    sput-object v0, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->ajc$initFailureCause:Ljava/lang/Throwable;

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static ajc$inlineAccessMethod$com_disney_id_android_gintonic_aspect_TraceAspect$com_disney_id_android_gintonic_aspect_TraceAspect$buildLogMessage(Ljava/lang/String;J)Ljava/lang/String;
    .locals 1

    .prologue
    .line 1
    invoke-static {p0, p1, p2}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->buildLogMessage(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static ajc$postClinit()V
    .locals 1

    .prologue
    .line 1
    new-instance v0, Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    invoke-direct {v0}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;-><init>()V

    sput-object v0, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->ajc$perSingletonInstance:Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    return-void
.end method

.method public static aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;
    .locals 3

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->ajc$perSingletonInstance:Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    if-nez v0, :cond_0

    new-instance v0, Lorg/aspectj/lang/NoAspectBoundException;

    const-string v1, "com.disney.id.android.gintonic.aspect.TraceAspect"

    sget-object v2, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->ajc$initFailureCause:Ljava/lang/Throwable;

    invoke-direct {v0, v1, v2}, Lorg/aspectj/lang/NoAspectBoundException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :cond_0
    sget-object v0, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->ajc$perSingletonInstance:Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    return-object v0
.end method

.method private static buildLogMessage(Ljava/lang/String;J)Ljava/lang/String;
    .locals 3
    .param p0, "methodName"    # Ljava/lang/String;
    .param p1, "methodDuration"    # J

    .prologue
    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .local v0, "message":Ljava/lang/StringBuilder;
    const-string v1, "oneID:TRACE --> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    const-string v1, " --> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 64
    const-string v1, "ms"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static hasAspect()Z
    .locals 1

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->ajc$perSingletonInstance:Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public constructorAnnotatedDIDTrace()V
    .locals 0
    .annotation runtime Lorg/aspectj/lang/annotation/Pointcut;
        value = "execution(@com.disney.id.android.gintonic.annotation.DIDTrace *.new(..))"
    .end annotation

    .prologue
    .line 32
    return-void
.end method

.method public methodAnnotatedWithDIDTrace()V
    .locals 0
    .annotation runtime Lorg/aspectj/lang/annotation/Pointcut;
        value = "execution(@com.disney.id.android.gintonic.annotation.DIDTrace * *(..))"
    .end annotation

    .prologue
    .line 29
    return-void
.end method

.method public weaveJoinPoint(Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p1, "joinPoint"    # Lorg/aspectj/lang/ProceedingJoinPoint;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .annotation runtime Lorg/aspectj/lang/annotation/Around;
        value = "methodAnnotatedWithDIDTrace() || constructorAnnotatedDIDTrace()"
    .end annotation

    .prologue
    .line 36
    invoke-interface {p1}, Lorg/aspectj/lang/ProceedingJoinPoint;->getSignature()Lorg/aspectj/lang/Signature;

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
    invoke-interface {p1}, Lorg/aspectj/lang/ProceedingJoinPoint;->proceed()Ljava/lang/Object;

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
