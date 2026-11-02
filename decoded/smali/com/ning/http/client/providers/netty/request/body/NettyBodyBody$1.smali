.class Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody$1;
.super Ljava/lang/Object;
.source "NettyBodyBody.java"

# interfaces
.implements Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$FeedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;->write(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHttpClientConfig;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;

.field final synthetic val$channel:Lorg/jboss/netty/channel/Channel;


# direct methods
.method constructor <init>(Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;Lorg/jboss/netty/channel/Channel;)V
    .locals 0

    .prologue
    .line 70
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody$1;->this$0:Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody;

    iput-object p2, p0, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody$1;->val$channel:Lorg/jboss/netty/channel/Channel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onContentAdded()V
    .locals 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/NettyBodyBody$1;->val$channel:Lorg/jboss/netty/channel/Channel;

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    const-class v1, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelPipeline;->get(Ljava/lang/Class;)Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/stream/ChunkedWriteHandler;->resumeTransfer()V

    .line 74
    return-void
.end method
