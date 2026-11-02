.class final Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Encoder;
.super Lorg/jboss/netty/handler/codec/http/HttpRequestEncoder;
.source "HttpClientCodec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/http/HttpClientCodec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Encoder"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/handler/codec/http/HttpClientCodec;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/codec/http/HttpClientCodec;)V
    .locals 0

    .prologue
    .line 102
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Encoder;->this$0:Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/HttpRequestEncoder;-><init>()V

    .line 103
    return-void
.end method


# virtual methods
.method protected encode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "msg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 108
    instance-of v1, p3, Lorg/jboss/netty/handler/codec/http/HttpRequest;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Encoder;->this$0:Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    iget-boolean v1, v1, Lorg/jboss/netty/handler/codec/http/HttpClientCodec;->done:Z

    if-nez v1, :cond_0

    .line 109
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Encoder;->this$0:Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    iget-object v2, v1, Lorg/jboss/netty/handler/codec/http/HttpClientCodec;->queue:Ljava/util/Queue;

    move-object v1, p3

    check-cast v1, Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->getMethod()Lorg/jboss/netty/handler/codec/http/HttpMethod;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 112
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lorg/jboss/netty/handler/codec/http/HttpRequestEncoder;->encode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 114
    .local v0, "obj":Ljava/lang/Object;
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Encoder;->this$0:Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    invoke-static {v1}, Lorg/jboss/netty/handler/codec/http/HttpClientCodec;->access$000(Lorg/jboss/netty/handler/codec/http/HttpClientCodec;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 116
    instance-of v1, p3, Lorg/jboss/netty/handler/codec/http/HttpRequest;

    if-eqz v1, :cond_2

    move-object v1, p3

    check-cast v1, Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->isChunked()Z

    move-result v1

    if-nez v1, :cond_2

    .line 117
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Encoder;->this$0:Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    invoke-static {v1}, Lorg/jboss/netty/handler/codec/http/HttpClientCodec;->access$100(Lorg/jboss/netty/handler/codec/http/HttpClientCodec;)Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    .line 123
    .end local p3    # "msg":Ljava/lang/Object;
    :cond_1
    :goto_0
    return-object v0

    .line 118
    .restart local p3    # "msg":Ljava/lang/Object;
    :cond_2
    instance-of v1, p3, Lorg/jboss/netty/handler/codec/http/HttpChunk;

    if-eqz v1, :cond_1

    check-cast p3, Lorg/jboss/netty/handler/codec/http/HttpChunk;

    .end local p3    # "msg":Ljava/lang/Object;
    invoke-interface {p3}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->isLast()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 120
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Encoder;->this$0:Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    invoke-static {v1}, Lorg/jboss/netty/handler/codec/http/HttpClientCodec;->access$100(Lorg/jboss/netty/handler/codec/http/HttpClientCodec;)Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    goto :goto_0
.end method
