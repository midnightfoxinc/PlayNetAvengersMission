.class public Lcom/ning/http/client/resumable/ResumableAsyncHandler;
.super Ljava/lang/Object;
.source "ResumableAsyncHandler.java"

# interfaces
.implements Lcom/ning/http/client/AsyncHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/resumable/ResumableAsyncHandler$1;,
        Lcom/ning/http/client/resumable/ResumableAsyncHandler$NULLResumableListener;,
        Lcom/ning/http/client/resumable/ResumableAsyncHandler$NULLResumableHandler;,
        Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;,
        Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableIndexThread;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/ning/http/client/AsyncHandler",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final logger:Lorg/slf4j/Logger;

.field private static resumableIndex:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private static final resumeIndexThread:Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableIndexThread;


# instance fields
.field private final accumulateBody:Z

.field private final byteTransferred:Ljava/util/concurrent/atomic/AtomicLong;

.field private final decoratedAsyncHandler:Lcom/ning/http/client/AsyncHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;"
        }
    .end annotation
.end field

.field private responseBuilder:Lcom/ning/http/client/Response$ResponseBuilder;

.field private resumableListener:Lcom/ning/http/client/resumable/ResumableListener;

.field private final resumableProcessor:Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;

.field private url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    const-class v0, Lcom/ning/http/client/listener/TransferCompletionHandler;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->logger:Lorg/slf4j/Logger;

    .line 49
    new-instance v0, Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableIndexThread;

    invoke-direct {v0}, Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableIndexThread;-><init>()V

    sput-object v0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->resumeIndexThread:Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableIndexThread;

    return-void
.end method

.method public constructor <init>()V
    .locals 7

    .prologue
    .local p0, "this":Lcom/ning/http/client/resumable/ResumableAsyncHandler;, "Lcom/ning/http/client/resumable/ResumableAsyncHandler<TT;>;"
    const/4 v4, 0x0

    .line 82
    const-wide/16 v2, 0x0

    const/4 v6, 0x0

    move-object v1, p0

    move-object v5, v4

    invoke-direct/range {v1 .. v6}, Lcom/ning/http/client/resumable/ResumableAsyncHandler;-><init>(JLcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;Lcom/ning/http/client/AsyncHandler;Z)V

    .line 83
    return-void
.end method

.method public constructor <init>(J)V
    .locals 7
    .param p1, "byteTransferred"    # J

    .prologue
    .local p0, "this":Lcom/ning/http/client/resumable/ResumableAsyncHandler;, "Lcom/ning/http/client/resumable/ResumableAsyncHandler<TT;>;"
    const/4 v4, 0x0

    .line 74
    const/4 v6, 0x0

    move-object v1, p0

    move-wide v2, p1

    move-object v5, v4

    invoke-direct/range {v1 .. v6}, Lcom/ning/http/client/resumable/ResumableAsyncHandler;-><init>(JLcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;Lcom/ning/http/client/AsyncHandler;Z)V

    .line 75
    return-void
.end method

.method public constructor <init>(JLcom/ning/http/client/AsyncHandler;)V
    .locals 7
    .param p1, "byteTransferred"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 90
    .local p0, "this":Lcom/ning/http/client/resumable/ResumableAsyncHandler;, "Lcom/ning/http/client/resumable/ResumableAsyncHandler<TT;>;"
    .local p3, "decoratedAsyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TT;>;"
    new-instance v4, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;

    invoke-direct {v4}, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;-><init>()V

    const/4 v6, 0x0

    move-object v1, p0

    move-wide v2, p1

    move-object v5, p3

    invoke-direct/range {v1 .. v6}, Lcom/ning/http/client/resumable/ResumableAsyncHandler;-><init>(JLcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;Lcom/ning/http/client/AsyncHandler;Z)V

    .line 91
    return-void
.end method

.method private constructor <init>(JLcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;Lcom/ning/http/client/AsyncHandler;Z)V
    .locals 3
    .param p1, "byteTransferred"    # J
    .param p3, "resumableProcessor"    # Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;
    .param p5, "accumulateBody"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;",
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;Z)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/ning/http/client/resumable/ResumableAsyncHandler;, "Lcom/ning/http/client/resumable/ResumableAsyncHandler<TT;>;"
    .local p4, "decoratedAsyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TT;>;"
    const/4 v1, 0x0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Lcom/ning/http/client/Response$ResponseBuilder;

    invoke-direct {v0}, Lcom/ning/http/client/Response$ResponseBuilder;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->responseBuilder:Lcom/ning/http/client/Response$ResponseBuilder;

    .line 52
    new-instance v0, Lcom/ning/http/client/resumable/ResumableAsyncHandler$NULLResumableListener;

    invoke-direct {v0, v1}, Lcom/ning/http/client/resumable/ResumableAsyncHandler$NULLResumableListener;-><init>(Lcom/ning/http/client/resumable/ResumableAsyncHandler$1;)V

    iput-object v0, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->resumableListener:Lcom/ning/http/client/resumable/ResumableListener;

    .line 59
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    iput-object v0, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->byteTransferred:Ljava/util/concurrent/atomic/AtomicLong;

    .line 61
    if-nez p3, :cond_0

    .line 62
    new-instance p3, Lcom/ning/http/client/resumable/ResumableAsyncHandler$NULLResumableHandler;

    .end local p3    # "resumableProcessor":Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;
    invoke-direct {p3, v1}, Lcom/ning/http/client/resumable/ResumableAsyncHandler$NULLResumableHandler;-><init>(Lcom/ning/http/client/resumable/ResumableAsyncHandler$1;)V

    .line 64
    .restart local p3    # "resumableProcessor":Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;
    :cond_0
    iput-object p3, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->resumableProcessor:Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;

    .line 66
    invoke-interface {p3}, Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;->load()Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->resumableIndex:Ljava/util/Map;

    .line 67
    sget-object v0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->resumeIndexThread:Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableIndexThread;

    invoke-virtual {v0, p3}, Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableIndexThread;->addResumableProcessor(Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;)V

    .line 69
    iput-object p4, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->decoratedAsyncHandler:Lcom/ning/http/client/AsyncHandler;

    .line 70
    iput-boolean p5, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->accumulateBody:Z

    .line 71
    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/AsyncHandler;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 86
    .local p0, "this":Lcom/ning/http/client/resumable/ResumableAsyncHandler;, "Lcom/ning/http/client/resumable/ResumableAsyncHandler<TT;>;"
    .local p1, "decoratedAsyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TT;>;"
    const-wide/16 v2, 0x0

    new-instance v4, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;

    invoke-direct {v4}, Lcom/ning/http/client/resumable/PropertiesBasedResumableProcessor;-><init>()V

    const/4 v6, 0x0

    move-object v1, p0

    move-object v5, p1

    invoke-direct/range {v1 .. v6}, Lcom/ning/http/client/resumable/ResumableAsyncHandler;-><init>(JLcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;Lcom/ning/http/client/AsyncHandler;Z)V

    .line 87
    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;)V
    .locals 7
    .param p1, "resumableProcessor"    # Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;

    .prologue
    .line 94
    .local p0, "this":Lcom/ning/http/client/resumable/ResumableAsyncHandler;, "Lcom/ning/http/client/resumable/ResumableAsyncHandler<TT;>;"
    const-wide/16 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p0

    move-object v4, p1

    invoke-direct/range {v1 .. v6}, Lcom/ning/http/client/resumable/ResumableAsyncHandler;-><init>(JLcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;Lcom/ning/http/client/AsyncHandler;Z)V

    .line 95
    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;Z)V
    .locals 7
    .param p1, "resumableProcessor"    # Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;
    .param p2, "accumulateBody"    # Z

    .prologue
    .line 98
    .local p0, "this":Lcom/ning/http/client/resumable/ResumableAsyncHandler;, "Lcom/ning/http/client/resumable/ResumableAsyncHandler<TT;>;"
    const-wide/16 v2, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v4, p1

    move v6, p2

    invoke-direct/range {v1 .. v6}, Lcom/ning/http/client/resumable/ResumableAsyncHandler;-><init>(JLcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;Lcom/ning/http/client/AsyncHandler;Z)V

    .line 99
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 7
    .param p1, "accumulateBody"    # Z

    .prologue
    .local p0, "this":Lcom/ning/http/client/resumable/ResumableAsyncHandler;, "Lcom/ning/http/client/resumable/ResumableAsyncHandler<TT;>;"
    const/4 v4, 0x0

    .line 78
    const-wide/16 v2, 0x0

    move-object v1, p0

    move-object v5, v4

    move v6, p1

    invoke-direct/range {v1 .. v6}, Lcom/ning/http/client/resumable/ResumableAsyncHandler;-><init>(JLcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;Lcom/ning/http/client/AsyncHandler;Z)V

    .line 79
    return-void
.end method

.method static synthetic access$200()Ljava/util/Map;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->resumableIndex:Ljava/util/Map;

    return-object v0
.end method


# virtual methods
.method public adjustRequestRange(Lcom/ning/http/client/Request;)Lcom/ning/http/client/Request;
    .locals 8
    .param p1, "request"    # Lcom/ning/http/client/Request;

    .prologue
    .local p0, "this":Lcom/ning/http/client/resumable/ResumableAsyncHandler;, "Lcom/ning/http/client/resumable/ResumableAsyncHandler<TT;>;"
    const-wide/16 v6, 0x0

    .line 188
    sget-object v2, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->resumableIndex:Ljava/util/Map;

    invoke-interface {p1}, Lcom/ning/http/client/Request;->getUrl()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    .line 189
    .local v1, "ri":Ljava/lang/Long;
    if-eqz v1, :cond_0

    .line 190
    iget-object v2, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->byteTransferred:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 194
    :cond_0
    iget-object v2, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->resumableListener:Lcom/ning/http/client/resumable/ResumableListener;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->resumableListener:Lcom/ning/http/client/resumable/ResumableListener;

    invoke-interface {v2}, Lcom/ning/http/client/resumable/ResumableListener;->length()J

    move-result-wide v2

    cmp-long v2, v2, v6

    if-lez v2, :cond_1

    iget-object v2, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->byteTransferred:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    iget-object v4, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->resumableListener:Lcom/ning/http/client/resumable/ResumableListener;

    invoke-interface {v4}, Lcom/ning/http/client/resumable/ResumableListener;->length()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1

    .line 195
    iget-object v2, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->byteTransferred:Ljava/util/concurrent/atomic/AtomicLong;

    iget-object v3, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->resumableListener:Lcom/ning/http/client/resumable/ResumableListener;

    invoke-interface {v3}, Lcom/ning/http/client/resumable/ResumableListener;->length()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 198
    :cond_1
    new-instance v0, Lcom/ning/http/client/RequestBuilder;

    invoke-direct {v0, p1}, Lcom/ning/http/client/RequestBuilder;-><init>(Lcom/ning/http/client/Request;)V

    .line 199
    .local v0, "builder":Lcom/ning/http/client/RequestBuilder;
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v2

    const-string v3, "Range"

    invoke-virtual {v2, v3}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->byteTransferred:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    cmp-long v2, v2, v6

    if-eqz v2, :cond_2

    .line 200
    const-string v2, "Range"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bytes="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->byteTransferred:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/ning/http/client/RequestBuilder;->setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilder;

    .line 202
    :cond_2
    invoke-virtual {v0}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v2

    return-object v2
.end method

.method public onBodyPartReceived(Lcom/ning/http/client/HttpResponseBodyPart;)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 6
    .param p1, "bodyPart"    # Lcom/ning/http/client/HttpResponseBodyPart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 129
    .local p0, "this":Lcom/ning/http/client/resumable/ResumableAsyncHandler;, "Lcom/ning/http/client/resumable/ResumableAsyncHandler<TT;>;"
    iget-boolean v2, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->accumulateBody:Z

    if-eqz v2, :cond_0

    .line 130
    iget-object v2, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->responseBuilder:Lcom/ning/http/client/Response$ResponseBuilder;

    invoke-virtual {v2, p1}, Lcom/ning/http/client/Response$ResponseBuilder;->accumulate(Lcom/ning/http/client/HttpResponseBodyPart;)Lcom/ning/http/client/Response$ResponseBuilder;

    .line 133
    :cond_0
    sget-object v1, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    .line 135
    .local v1, "state":Lcom/ning/http/client/AsyncHandler$STATE;
    :try_start_0
    iget-object v2, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->resumableListener:Lcom/ning/http/client/resumable/ResumableListener;

    invoke-virtual {p1}, Lcom/ning/http/client/HttpResponseBodyPart;->getBodyByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/ning/http/client/resumable/ResumableListener;->onBytesReceived(Ljava/nio/ByteBuffer;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    iget-object v2, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->decoratedAsyncHandler:Lcom/ning/http/client/AsyncHandler;

    if-eqz v2, :cond_1

    .line 141
    iget-object v2, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->decoratedAsyncHandler:Lcom/ning/http/client/AsyncHandler;

    invoke-interface {v2, p1}, Lcom/ning/http/client/AsyncHandler;->onBodyPartReceived(Lcom/ning/http/client/HttpResponseBodyPart;)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v1

    .line 144
    :cond_1
    iget-object v2, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->byteTransferred:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {p1}, Lcom/ning/http/client/HttpResponseBodyPart;->getBodyPartBytes()[B

    move-result-object v3

    array-length v3, v3

    int-to-long v4, v3

    invoke-virtual {v2, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 145
    iget-object v2, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->resumableProcessor:Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;

    iget-object v3, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->url:Ljava/lang/String;

    iget-object v4, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->byteTransferred:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v4

    invoke-interface {v2, v3, v4, v5}, Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;->put(Ljava/lang/String;J)V

    move-object v2, v1

    .line 147
    :goto_0
    return-object v2

    .line 136
    :catch_0
    move-exception v0

    .line 137
    .local v0, "ex":Ljava/io/IOException;
    sget-object v2, Lcom/ning/http/client/AsyncHandler$STATE;->ABORT:Lcom/ning/http/client/AsyncHandler$STATE;

    goto :goto_0
.end method

.method public onCompleted()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 153
    .local p0, "this":Lcom/ning/http/client/resumable/ResumableAsyncHandler;, "Lcom/ning/http/client/resumable/ResumableAsyncHandler<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->resumableProcessor:Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;

    iget-object v1, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->url:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/ning/http/client/resumable/ResumableAsyncHandler$ResumableProcessor;->remove(Ljava/lang/String;)V

    .line 154
    iget-object v0, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->resumableListener:Lcom/ning/http/client/resumable/ResumableListener;

    invoke-interface {v0}, Lcom/ning/http/client/resumable/ResumableListener;->onAllBytesReceived()V

    .line 156
    iget-object v0, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->decoratedAsyncHandler:Lcom/ning/http/client/AsyncHandler;

    if-eqz v0, :cond_0

    .line 157
    iget-object v0, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->decoratedAsyncHandler:Lcom/ning/http/client/AsyncHandler;

    invoke-interface {v0}, Lcom/ning/http/client/AsyncHandler;->onCompleted()Ljava/lang/Object;

    .line 160
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->responseBuilder:Lcom/ning/http/client/Response$ResponseBuilder;

    invoke-virtual {v0}, Lcom/ning/http/client/Response$ResponseBuilder;->build()Lcom/ning/http/client/Response;

    move-result-object v0

    return-object v0
.end method

.method public onHeadersReceived(Lcom/ning/http/client/HttpResponseHeaders;)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 6
    .param p1, "headers"    # Lcom/ning/http/client/HttpResponseHeaders;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 165
    .local p0, "this":Lcom/ning/http/client/resumable/ResumableAsyncHandler;, "Lcom/ning/http/client/resumable/ResumableAsyncHandler<TT;>;"
    iget-object v1, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->responseBuilder:Lcom/ning/http/client/Response$ResponseBuilder;

    invoke-virtual {v1, p1}, Lcom/ning/http/client/Response$ResponseBuilder;->accumulate(Lcom/ning/http/client/HttpResponseHeaders;)Lcom/ning/http/client/Response$ResponseBuilder;

    .line 166
    invoke-virtual {p1}, Lcom/ning/http/client/HttpResponseHeaders;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v1

    const-string v2, "Content-Length"

    invoke-virtual {v1, v2}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->getFirstValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 167
    .local v0, "contentLengthHeader":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 168
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    .line 169
    sget-object v1, Lcom/ning/http/client/AsyncHandler$STATE;->ABORT:Lcom/ning/http/client/AsyncHandler$STATE;

    .line 176
    :goto_0
    return-object v1

    .line 173
    :cond_0
    iget-object v1, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->decoratedAsyncHandler:Lcom/ning/http/client/AsyncHandler;

    if-eqz v1, :cond_1

    .line 174
    iget-object v1, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->decoratedAsyncHandler:Lcom/ning/http/client/AsyncHandler;

    invoke-interface {v1, p1}, Lcom/ning/http/client/AsyncHandler;->onHeadersReceived(Lcom/ning/http/client/HttpResponseHeaders;)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v1

    goto :goto_0

    .line 176
    :cond_1
    sget-object v1, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    goto :goto_0
.end method

.method public onStatusReceived(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 2
    .param p1, "status"    # Lcom/ning/http/client/HttpResponseStatus;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 103
    .local p0, "this":Lcom/ning/http/client/resumable/ResumableAsyncHandler;, "Lcom/ning/http/client/resumable/ResumableAsyncHandler<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->responseBuilder:Lcom/ning/http/client/Response$ResponseBuilder;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/Response$ResponseBuilder;->accumulate(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/Response$ResponseBuilder;

    .line 104
    invoke-virtual {p1}, Lcom/ning/http/client/HttpResponseStatus;->getStatusCode()I

    move-result v0

    const/16 v1, 0xc8

    if-eq v0, v1, :cond_0

    invoke-virtual {p1}, Lcom/ning/http/client/HttpResponseStatus;->getStatusCode()I

    move-result v0

    const/16 v1, 0xce

    if-ne v0, v1, :cond_1

    .line 105
    :cond_0
    invoke-virtual {p1}, Lcom/ning/http/client/HttpResponseStatus;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ning/http/client/uri/Uri;->toUrl()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->url:Ljava/lang/String;

    .line 110
    iget-object v0, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->decoratedAsyncHandler:Lcom/ning/http/client/AsyncHandler;

    if-eqz v0, :cond_2

    .line 111
    iget-object v0, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->decoratedAsyncHandler:Lcom/ning/http/client/AsyncHandler;

    invoke-interface {v0, p1}, Lcom/ning/http/client/AsyncHandler;->onStatusReceived(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v0

    .line 114
    :goto_0
    return-object v0

    .line 107
    :cond_1
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->ABORT:Lcom/ning/http/client/AsyncHandler$STATE;

    goto :goto_0

    .line 114
    :cond_2
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    goto :goto_0
.end method

.method public onThrowable(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 119
    .local p0, "this":Lcom/ning/http/client/resumable/ResumableAsyncHandler;, "Lcom/ning/http/client/resumable/ResumableAsyncHandler<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->decoratedAsyncHandler:Lcom/ning/http/client/AsyncHandler;

    if-eqz v0, :cond_0

    .line 120
    iget-object v0, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->decoratedAsyncHandler:Lcom/ning/http/client/AsyncHandler;

    invoke-interface {v0, p1}, Lcom/ning/http/client/AsyncHandler;->onThrowable(Ljava/lang/Throwable;)V

    .line 124
    :goto_0
    return-void

    .line 122
    :cond_0
    sget-object v0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->logger:Lorg/slf4j/Logger;

    const-string v1, ""

    invoke-interface {v0, v1, p1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public setResumableListener(Lcom/ning/http/client/resumable/ResumableListener;)Lcom/ning/http/client/resumable/ResumableAsyncHandler;
    .locals 0
    .param p1, "resumableListener"    # Lcom/ning/http/client/resumable/ResumableListener;

    .prologue
    .line 213
    .local p0, "this":Lcom/ning/http/client/resumable/ResumableAsyncHandler;, "Lcom/ning/http/client/resumable/ResumableAsyncHandler<TT;>;"
    iput-object p1, p0, Lcom/ning/http/client/resumable/ResumableAsyncHandler;->resumableListener:Lcom/ning/http/client/resumable/ResumableListener;

    .line 214
    return-object p0
.end method
