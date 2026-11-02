.class public Lcom/ning/http/client/providers/netty/request/ProgressListener;
.super Ljava/lang/Object;
.source "ProgressListener.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelFutureProgressListener;


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# instance fields
.field private final asyncHandler:Lcom/ning/http/client/AsyncHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/ning/http/client/AsyncHandler",
            "<*>;"
        }
    .end annotation
.end field

.field private final config:Lcom/ning/http/client/AsyncHttpClientConfig;

.field private final future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;"
        }
    .end annotation
.end field

.field private final notifyHeaders:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const-class v0, Lcom/ning/http/client/providers/netty/request/ProgressListener;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/netty/request/ProgressListener;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Z)V
    .locals 0
    .param p1, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;
    .param p4, "notifyHeaders"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/AsyncHttpClientConfig;",
            "Lcom/ning/http/client/AsyncHandler",
            "<*>;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;Z)V"
        }
    .end annotation

    .prologue
    .line 44
    .local p2, "asyncHandler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<*>;"
    .local p3, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/request/ProgressListener;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    .line 46
    iput-object p2, p0, Lcom/ning/http/client/providers/netty/request/ProgressListener;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    .line 47
    iput-object p3, p0, Lcom/ning/http/client/providers/netty/request/ProgressListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    .line 48
    iput-boolean p4, p0, Lcom/ning/http/client/providers/netty/request/ProgressListener;->notifyHeaders:Z

    .line 49
    return-void
.end method

.method private abortOnThrowable(Ljava/lang/Throwable;Lorg/jboss/netty/channel/Channel;)Z
    .locals 2
    .param p1, "cause"    # Ljava/lang/Throwable;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 52
    if-eqz p1, :cond_3

    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/ProgressListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getState()Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    move-result-object v0

    sget-object v1, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;->NEW:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    if-eq v0, v1, :cond_3

    .line 55
    instance-of v0, p1, Ljava/lang/IllegalStateException;

    if-nez v0, :cond_0

    instance-of v0, p1, Ljava/nio/channels/ClosedChannelException;

    if-nez v0, :cond_0

    invoke-static {p1}, Lcom/ning/http/client/providers/netty/future/StackTraceInspector;->recoverOnReadOrWriteException(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 56
    :cond_0
    sget-object v1, Lcom/ning/http/client/providers/netty/request/ProgressListener;->LOGGER:Lorg/slf4j/Logger;

    if-nez p1, :cond_1

    const-string v0, ""

    :goto_0
    invoke-interface {v1, v0, p1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 57
    invoke-static {p2}, Lcom/ning/http/client/providers/netty/channel/Channels;->silentlyCloseChannel(Lorg/jboss/netty/channel/Channel;)V

    .line 62
    :goto_1
    const/4 v0, 0x1

    .line 64
    :goto_2
    return v0

    .line 56
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 60
    :cond_2
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/ProgressListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->abort(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 64
    :cond_3
    const/4 v0, 0x0

    goto :goto_2
.end method


# virtual methods
.method public operationComplete(Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 4
    .param p1, "cf"    # Lorg/jboss/netty/channel/ChannelFuture;

    .prologue
    .line 69
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/ning/http/client/providers/netty/request/ProgressListener;->abortOnThrowable(Ljava/lang/Throwable;Lorg/jboss/netty/channel/Channel;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 70
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/request/ProgressListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->touch()V

    .line 76
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/request/ProgressListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v2

    invoke-interface {v2}, Lcom/ning/http/client/Request;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/request/ProgressListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v2

    invoke-interface {v2}, Lcom/ning/http/client/Request;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v0

    .line 77
    .local v0, "realm":Lcom/ning/http/client/Realm;
    :goto_0
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/request/ProgressListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isInAuth()Z

    move-result v2

    if-nez v2, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/ning/http/client/Realm;->getUsePreemptiveAuth()Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_0
    const/4 v1, 0x1

    .line 79
    .local v1, "startPublishing":Z
    :goto_1
    if-eqz v1, :cond_1

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/request/ProgressListener;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    instance-of v2, v2, Lcom/ning/http/client/ProgressAsyncHandler;

    if-eqz v2, :cond_1

    .line 80
    iget-boolean v2, p0, Lcom/ning/http/client/providers/netty/request/ProgressListener;->notifyHeaders:Z

    if-eqz v2, :cond_4

    .line 81
    const-class v2, Lcom/ning/http/client/ProgressAsyncHandler;

    iget-object v3, p0, Lcom/ning/http/client/providers/netty/request/ProgressListener;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    invoke-virtual {v2, v3}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/ProgressAsyncHandler;

    invoke-interface {v2}, Lcom/ning/http/client/ProgressAsyncHandler;->onHeaderWriteCompleted()Lcom/ning/http/client/AsyncHandler$STATE;

    .line 87
    .end local v0    # "realm":Lcom/ning/http/client/Realm;
    .end local v1    # "startPublishing":Z
    :cond_1
    :goto_2
    return-void

    .line 76
    :cond_2
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/request/ProgressListener;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v2}, Lcom/ning/http/client/AsyncHttpClientConfig;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v0

    goto :goto_0

    .line 77
    .restart local v0    # "realm":Lcom/ning/http/client/Realm;
    :cond_3
    const/4 v1, 0x0

    goto :goto_1

    .line 83
    .restart local v1    # "startPublishing":Z
    :cond_4
    const-class v2, Lcom/ning/http/client/ProgressAsyncHandler;

    iget-object v3, p0, Lcom/ning/http/client/providers/netty/request/ProgressListener;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    invoke-virtual {v2, v3}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/ProgressAsyncHandler;

    invoke-interface {v2}, Lcom/ning/http/client/ProgressAsyncHandler;->onContentWriteCompleted()Lcom/ning/http/client/AsyncHandler$STATE;

    goto :goto_2
.end method

.method public operationProgressed(Lorg/jboss/netty/channel/ChannelFuture;JJJ)V
    .locals 8
    .param p1, "cf"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p2, "amount"    # J
    .param p4, "current"    # J
    .param p6, "total"    # J

    .prologue
    .line 90
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/ProgressListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->touch()V

    .line 91
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/ProgressListener;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    instance-of v0, v0, Lcom/ning/http/client/ProgressAsyncHandler;

    if-eqz v0, :cond_0

    .line 92
    const-class v0, Lcom/ning/http/client/ProgressAsyncHandler;

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/request/ProgressListener;->asyncHandler:Lcom/ning/http/client/AsyncHandler;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/ProgressAsyncHandler;

    move-wide v2, p2

    move-wide v4, p4

    move-wide v6, p6

    invoke-interface/range {v1 .. v7}, Lcom/ning/http/client/ProgressAsyncHandler;->onContentWriteProgress(JJJ)Lcom/ning/http/client/AsyncHandler$STATE;

    .line 94
    :cond_0
    return-void
.end method
