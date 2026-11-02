.class Lcom/disney/id/android/DIDService$DIDWebReceiver;
.super Landroid/content/BroadcastReceiver;
.source "DIDService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/DIDService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DIDWebReceiver"
.end annotation


# static fields
.field private static final ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/DIDService;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .prologue
    .line 1
    invoke-static {}, Lcom/disney/id/android/DIDService$DIDWebReceiver;->ajc$preClinit()V

    return-void
.end method

.method private constructor <init>(Lcom/disney/id/android/DIDService;)V
    .locals 0

    .prologue
    .line 165
    iput-object p1, p0, Lcom/disney/id/android/DIDService$DIDWebReceiver;->this$0:Lcom/disney/id/android/DIDService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/disney/id/android/DIDService;Lcom/disney/id/android/DIDService$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/disney/id/android/DIDService;
    .param p2, "x1"    # Lcom/disney/id/android/DIDService$1;

    .prologue
    .line 165
    invoke-direct {p0, p1}, Lcom/disney/id/android/DIDService$DIDWebReceiver;-><init>(Lcom/disney/id/android/DIDService;)V

    return-void
.end method

.method private static ajc$preClinit()V
    .locals 9

    .prologue
    .line 1
    new-instance v0, Lorg/aspectj/runtime/reflect/Factory;

    const-string v1, "DIDService.java"

    const-class v2, Lcom/disney/id/android/DIDService$DIDWebReceiver;

    invoke-direct {v0, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    const-string v8, "method-execution"

    const-string v1, "1"

    const-string v2, "onReceive"

    const-string v3, "com.disney.id.android.DIDService$DIDWebReceiver"

    const-string v4, "android.content.Context:android.content.Intent"

    const-string v5, "context:intent"

    const-string v6, ""

    const-string v7, "void"

    invoke-virtual/range {v0 .. v7}, Lorg/aspectj/runtime/reflect/Factory;->makeMethodSig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/aspectj/lang/reflect/MethodSignature;

    move-result-object v1

    const/16 v2, 0xaa

    invoke-virtual {v0, v8, v1, v2}, Lorg/aspectj/runtime/reflect/Factory;->makeSJP(Ljava/lang/String;Lorg/aspectj/lang/Signature;I)Lorg/aspectj/lang/JoinPoint$StaticPart;

    move-result-object v0

    sput-object v0, Lcom/disney/id/android/DIDService$DIDWebReceiver;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    return-void
.end method

.method private static final onReceive_aroundBody0(Lcom/disney/id/android/DIDService$DIDWebReceiver;Landroid/content/Context;Landroid/content/Intent;Lorg/aspectj/lang/JoinPoint;)V
    .locals 7
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDService$DIDWebReceiver;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 170
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    const-string v4, "com.disney.id.android.ACTION"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 172
    const/4 v0, 0x5

    .line 173
    .local v0, "FIVE_SECONDS_IN_SECONDS":I
    :try_start_0
    invoke-static {}, Lcom/disney/id/android/DIDService;->access$200()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "Acquiring DIDWebReceiver semaphore"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    iget-object v3, p0, Lcom/disney/id/android/DIDService$DIDWebReceiver;->this$0:Lcom/disney/id/android/DIDService;

    invoke-static {v3}, Lcom/disney/id/android/DIDService;->access$300(Lcom/disney/id/android/DIDService;)Ljava/util/concurrent/Semaphore;

    move-result-object v3

    const-wide/16 v4, 0x5

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v4, v5, v6}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z

    .line 176
    const-string v3, "com.disney.id.android.RESULT"

    const/4 v4, 0x4

    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 179
    .local v2, "resultCode":I
    sparse-switch v2, :sswitch_data_0

    .line 198
    invoke-static {}, Lcom/disney/id/android/DIDService;->access$200()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unhandled resultCode: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/disney/id/android/DIDService$DIDWebReceiver;->this$0:Lcom/disney/id/android/DIDService;

    invoke-static {v3}, Lcom/disney/id/android/DIDService;->access$600(Lcom/disney/id/android/DIDService;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 206
    invoke-static {}, Lcom/disney/id/android/DIDService;->access$200()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "Releasing DIDWebReceiver semaphore"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    iget-object v3, p0, Lcom/disney/id/android/DIDService$DIDWebReceiver;->this$0:Lcom/disney/id/android/DIDService;

    invoke-static {v3}, Lcom/disney/id/android/DIDService;->access$300(Lcom/disney/id/android/DIDService;)Ljava/util/concurrent/Semaphore;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->release()V

    .line 210
    .end local v0    # "FIVE_SECONDS_IN_SECONDS":I
    .end local v2    # "resultCode":I
    :cond_1
    :goto_1
    return-void

    .line 185
    .restart local v0    # "FIVE_SECONDS_IN_SECONDS":I
    .restart local v2    # "resultCode":I
    :sswitch_0
    :try_start_1
    iget-object v3, p0, Lcom/disney/id/android/DIDService$DIDWebReceiver;->this$0:Lcom/disney/id/android/DIDService;

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/disney/id/android/DIDService;->access$400(Lcom/disney/id/android/DIDService;Z)V

    .line 186
    invoke-static {}, Lcom/disney/id/android/localization/DIDLocalizationManager;->getInstance()Lcom/disney/id/android/localization/DIDLocalizationManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/disney/id/android/localization/DIDLocalizationManager;->load()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 203
    .end local v2    # "resultCode":I
    :catch_0
    move-exception v1

    .line 204
    .local v1, "ex":Ljava/lang/Exception;
    :try_start_2
    invoke-static {}, Lcom/disney/id/android/DIDService;->access$200()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Unexpected exception"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 206
    invoke-static {}, Lcom/disney/id/android/DIDService;->access$200()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "Releasing DIDWebReceiver semaphore"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    iget-object v3, p0, Lcom/disney/id/android/DIDService$DIDWebReceiver;->this$0:Lcom/disney/id/android/DIDService;

    invoke-static {v3}, Lcom/disney/id/android/DIDService;->access$300(Lcom/disney/id/android/DIDService;)Ljava/util/concurrent/Semaphore;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->release()V

    goto :goto_1

    .line 189
    .end local v1    # "ex":Ljava/lang/Exception;
    .restart local v2    # "resultCode":I
    :sswitch_1
    :try_start_3
    const-string v3, "com.disney.id.android.REQUEST"

    const/16 v4, 0x100

    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    const/16 v4, 0x203

    if-ne v3, v4, :cond_0

    .line 191
    iget-object v3, p0, Lcom/disney/id/android/DIDService$DIDWebReceiver;->this$0:Lcom/disney/id/android/DIDService;

    const/4 v4, 0x1

    invoke-static {v3, v4}, Lcom/disney/id/android/DIDService;->access$400(Lcom/disney/id/android/DIDService;Z)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 206
    .end local v2    # "resultCode":I
    :catchall_0
    move-exception v3

    invoke-static {}, Lcom/disney/id/android/DIDService;->access$200()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/disney/id/android/DIDLogger;->tag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "Releasing DIDWebReceiver semaphore"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    iget-object v4, p0, Lcom/disney/id/android/DIDService$DIDWebReceiver;->this$0:Lcom/disney/id/android/DIDService;

    invoke-static {v4}, Lcom/disney/id/android/DIDService;->access$300(Lcom/disney/id/android/DIDService;)Ljava/util/concurrent/Semaphore;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/Semaphore;->release()V

    throw v3

    .line 194
    .restart local v2    # "resultCode":I
    :sswitch_2
    :try_start_4
    iget-object v3, p0, Lcom/disney/id/android/DIDService$DIDWebReceiver;->this$0:Lcom/disney/id/android/DIDService;

    invoke-static {v3}, Lcom/disney/id/android/DIDService;->access$500(Lcom/disney/id/android/DIDService;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 179
    nop

    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_0
        0x4 -> :sswitch_2
        0x11 -> :sswitch_0
        0x12 -> :sswitch_0
        0x13 -> :sswitch_1
        0x16 -> :sswitch_0
        0x18 -> :sswitch_0
    .end sparse-switch
.end method

.method private static final onReceive_aroundBody1$advice(Lcom/disney/id/android/DIDService$DIDWebReceiver;Landroid/content/Context;Landroid/content/Intent;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;
    .locals 8
    .param p0, "ajc$this"    # Lcom/disney/id/android/DIDService$DIDWebReceiver;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;
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
    invoke-static {p0, p1, p2, p5}, Lcom/disney/id/android/DIDService$DIDWebReceiver;->onReceive_aroundBody0(Lcom/disney/id/android/DIDService$DIDWebReceiver;Landroid/content/Context;Landroid/content/Intent;Lorg/aspectj/lang/JoinPoint;)V

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
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;
    .annotation build Lcom/disney/id/android/gintonic/annotation/DIDTrace;
    .end annotation

    .prologue
    .line 1
    sget-object v0, Lcom/disney/id/android/DIDService$DIDWebReceiver;->ajc$tjp_0:Lorg/aspectj/lang/JoinPoint$StaticPart;

    invoke-static {v0, p0, p0, p1, p2}, Lorg/aspectj/runtime/reflect/Factory;->makeJP(Lorg/aspectj/lang/JoinPoint$StaticPart;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/aspectj/lang/JoinPoint;

    move-result-object v3

    invoke-static {}, Lcom/disney/id/android/gintonic/aspect/TraceAspect;->aspectOf()Lcom/disney/id/android/gintonic/aspect/TraceAspect;

    move-result-object v4

    move-object v5, v3

    check-cast v5, Lorg/aspectj/lang/ProceedingJoinPoint;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-static/range {v0 .. v5}, Lcom/disney/id/android/DIDService$DIDWebReceiver;->onReceive_aroundBody1$advice(Lcom/disney/id/android/DIDService$DIDWebReceiver;Landroid/content/Context;Landroid/content/Intent;Lorg/aspectj/lang/JoinPoint;Lcom/disney/id/android/gintonic/aspect/TraceAspect;Lorg/aspectj/lang/ProceedingJoinPoint;)Ljava/lang/Object;

    return-void
.end method
