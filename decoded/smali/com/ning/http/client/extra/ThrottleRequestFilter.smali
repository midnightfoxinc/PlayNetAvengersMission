.class public Lcom/ning/http/client/extra/ThrottleRequestFilter;
.super Ljava/lang/Object;
.source "ThrottleRequestFilter.java"

# interfaces
.implements Lcom/ning/http/client/filter/RequestFilter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;
    }
.end annotation


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# instance fields
.field private final available:Ljava/util/concurrent/Semaphore;

.field private final maxWait:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-class v0, Lcom/ning/http/client/extra/ThrottleRequestFilter;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/extra/ThrottleRequestFilter;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "maxConnections"    # I

    .prologue
    .line 40
    const v0, 0x7fffffff

    invoke-direct {p0, p1, v0}, Lcom/ning/http/client/extra/ThrottleRequestFilter;-><init>(II)V

    .line 41
    return-void
.end method

.method public constructor <init>(II)V
    .locals 2
    .param p1, "maxConnections"    # I
    .param p2, "maxWait"    # I

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput p2, p0, Lcom/ning/http/client/extra/ThrottleRequestFilter;->maxWait:I

    .line 45
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Ljava/util/concurrent/Semaphore;-><init>(IZ)V

    iput-object v0, p0, Lcom/ning/http/client/extra/ThrottleRequestFilter;->available:Ljava/util/concurrent/Semaphore;

    .line 46
    return-void
.end method

.method static synthetic access$000(Lcom/ning/http/client/extra/ThrottleRequestFilter;)Ljava/util/concurrent/Semaphore;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/extra/ThrottleRequestFilter;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/ning/http/client/extra/ThrottleRequestFilter;->available:Ljava/util/concurrent/Semaphore;

    return-object v0
.end method

.method static synthetic access$100()Lorg/slf4j/Logger;
    .locals 1

    .prologue
    .line 34
    sget-object v0, Lcom/ning/http/client/extra/ThrottleRequestFilter;->LOGGER:Lorg/slf4j/Logger;

    return-object v0
.end method


# virtual methods
.method public filter(Lcom/ning/http/client/filter/FilterContext;)Lcom/ning/http/client/filter/FilterContext;
    .locals 9
    .param p1, "ctx"    # Lcom/ning/http/client/filter/FilterContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ning/http/client/filter/FilterException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 53
    :try_start_0
    sget-object v1, Lcom/ning/http/client/extra/ThrottleRequestFilter;->LOGGER:Lorg/slf4j/Logger;

    invoke-interface {v1}, Lorg/slf4j/Logger;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 54
    sget-object v1, Lcom/ning/http/client/extra/ThrottleRequestFilter;->LOGGER:Lorg/slf4j/Logger;

    const-string v2, "Current Throttling Status {}"

    iget-object v3, p0, Lcom/ning/http/client/extra/ThrottleRequestFilter;->available:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->availablePermits()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 56
    :cond_0
    iget-object v1, p0, Lcom/ning/http/client/extra/ThrottleRequestFilter;->available:Ljava/util/concurrent/Semaphore;

    iget v2, p0, Lcom/ning/http/client/extra/ThrottleRequestFilter;->maxWait:I

    int-to-long v2, v2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 57
    new-instance v1, Lcom/ning/http/client/filter/FilterException;

    const-string v2, "No slot available for processing Request %s with AsyncHandler %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p1}, Lcom/ning/http/client/filter/FilterContext;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-virtual {p1}, Lcom/ning/http/client/filter/FilterContext;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/ning/http/client/filter/FilterException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    :catch_0
    move-exception v0

    .line 62
    .local v0, "e":Ljava/lang/InterruptedException;
    new-instance v1, Lcom/ning/http/client/filter/FilterException;

    const-string v2, "Interrupted Request %s with AsyncHandler %s"

    new-array v3, v8, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/ning/http/client/filter/FilterContext;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {p1}, Lcom/ning/http/client/filter/FilterContext;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/ning/http/client/filter/FilterException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 66
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_1
    new-instance v1, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    invoke-direct {v1, p1}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;-><init>(Lcom/ning/http/client/filter/FilterContext;)V

    new-instance v2, Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;

    invoke-virtual {p1}, Lcom/ning/http/client/filter/FilterContext;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lcom/ning/http/client/extra/ThrottleRequestFilter$AsyncHandlerWrapper;-><init>(Lcom/ning/http/client/extra/ThrottleRequestFilter;Lcom/ning/http/client/AsyncHandler;)V

    invoke-virtual {v1, v2}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->asyncHandler(Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ning/http/client/filter/FilterContext$FilterContextBuilder;->build()Lcom/ning/http/client/filter/FilterContext;

    move-result-object v1

    return-object v1
.end method
