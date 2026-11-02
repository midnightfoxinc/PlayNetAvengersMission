.class final Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Decoder;
.super Lorg/jboss/netty/handler/codec/http/HttpResponseDecoder;
.source "HttpClientCodec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/http/HttpClientCodec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Decoder"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/handler/codec/http/HttpClientCodec;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/codec/http/HttpClientCodec;III)V
    .locals 0
    .param p2, "maxInitialLineLength"    # I
    .param p3, "maxHeaderSize"    # I
    .param p4, "maxChunkSize"    # I

    .prologue
    .line 129
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Decoder;->this$0:Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    .line 130
    invoke-direct {p0, p2, p3, p4}, Lorg/jboss/netty/handler/codec/http/HttpResponseDecoder;-><init>(III)V

    .line 131
    return-void
.end method

.method private decrement(Ljava/lang/Object;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/Object;

    .prologue
    .line 152
    if-nez p1, :cond_1

    .line 166
    :cond_0
    :goto_0
    return-void

    .line 157
    :cond_1
    instance-of v0, p1, Lorg/jboss/netty/handler/codec/http/HttpMessage;

    if-eqz v0, :cond_2

    move-object v0, p1

    check-cast v0, Lorg/jboss/netty/handler/codec/http/HttpMessage;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->isChunked()Z

    move-result v0

    if-nez v0, :cond_2

    .line 158
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Decoder;->this$0:Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    invoke-static {v0}, Lorg/jboss/netty/handler/codec/http/HttpClientCodec;->access$100(Lorg/jboss/netty/handler/codec/http/HttpClientCodec;)Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->decrementAndGet()J

    goto :goto_0

    .line 159
    :cond_2
    instance-of v0, p1, Lorg/jboss/netty/handler/codec/http/HttpChunk;

    if-eqz v0, :cond_3

    move-object v0, p1

    check-cast v0, Lorg/jboss/netty/handler/codec/http/HttpChunk;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->isLast()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 160
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Decoder;->this$0:Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    invoke-static {v0}, Lorg/jboss/netty/handler/codec/http/HttpClientCodec;->access$100(Lorg/jboss/netty/handler/codec/http/HttpClientCodec;)Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->decrementAndGet()J

    goto :goto_0

    .line 161
    :cond_3
    instance-of v0, p1, [Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 164
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Decoder;->this$0:Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    invoke-static {v0}, Lorg/jboss/netty/handler/codec/http/HttpClientCodec;->access$100(Lorg/jboss/netty/handler/codec/http/HttpClientCodec;)Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->decrementAndGet()J

    goto :goto_0
.end method


# virtual methods
.method public channelClosed(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 5
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 221
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/codec/http/HttpResponseDecoder;->channelClosed(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    .line 222
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Decoder;->this$0:Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    invoke-static {v2}, Lorg/jboss/netty/handler/codec/http/HttpClientCodec;->access$000(Lorg/jboss/netty/handler/codec/http/HttpClientCodec;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 223
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Decoder;->this$0:Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    invoke-static {v2}, Lorg/jboss/netty/handler/codec/http/HttpClientCodec;->access$100(Lorg/jboss/netty/handler/codec/http/HttpClientCodec;)Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    .line 224
    .local v0, "missingResponses":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    .line 225
    new-instance v2, Lorg/jboss/netty/handler/codec/PrematureChannelClosureException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Channel closed but still missing "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " response(s)"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jboss/netty/handler/codec/PrematureChannelClosureException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 229
    .end local v0    # "missingResponses":J
    :cond_0
    return-void
.end method

.method protected bridge synthetic decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/lang/Enum;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "x1"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "x2"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p4, "x3"    # Ljava/lang/Enum;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 127
    check-cast p4, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    .end local p4    # "x3":Ljava/lang/Enum;
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Decoder;->decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;)Ljava/lang/Object;
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p4, "state"    # Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 136
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Decoder;->this$0:Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    iget-boolean v2, v2, Lorg/jboss/netty/handler/codec/http/HttpClientCodec;->done:Z

    if-eqz v2, :cond_2

    .line 137
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Decoder;->actualReadableBytes()I

    move-result v1

    .line 138
    .local v1, "readable":I
    if-nez v1, :cond_1

    .line 139
    const/4 v0, 0x0

    .line 147
    .end local v1    # "readable":I
    :cond_0
    :goto_0
    return-object v0

    .line 141
    .restart local v1    # "readable":I
    :cond_1
    invoke-interface {p3, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    goto :goto_0

    .line 143
    .end local v1    # "readable":I
    :cond_2
    invoke-super {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/codec/http/HttpResponseDecoder;->decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;)Ljava/lang/Object;

    move-result-object v0

    .line 144
    .local v0, "msg":Ljava/lang/Object;
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Decoder;->this$0:Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    invoke-static {v2}, Lorg/jboss/netty/handler/codec/http/HttpClientCodec;->access$000(Lorg/jboss/netty/handler/codec/http/HttpClientCodec;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 145
    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Decoder;->decrement(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method protected isContentAlwaysEmpty(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z
    .locals 6
    .param p1, "msg"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    const/4 v4, 0x1

    .line 169
    move-object v3, p1

    check-cast v3, Lorg/jboss/netty/handler/codec/http/HttpResponse;

    invoke-interface {v3}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getStatus()Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getCode()I

    move-result v2

    .line 170
    .local v2, "statusCode":I
    const/16 v3, 0x64

    if-ne v2, v3, :cond_0

    move v3, v4

    .line 216
    :goto_0
    return v3

    .line 177
    :cond_0
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Decoder;->this$0:Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    iget-object v3, v3, Lorg/jboss/netty/handler/codec/http/HttpClientCodec;->queue:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/codec/http/HttpMethod;

    .line 179
    .local v1, "method":Lorg/jboss/netty/handler/codec/http/HttpMethod;
    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->getName()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 180
    .local v0, "firstChar":C
    sparse-switch v0, :sswitch_data_0

    .line 216
    :cond_1
    invoke-super {p0, p1}, Lorg/jboss/netty/handler/codec/http/HttpResponseDecoder;->isContentAlwaysEmpty(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z

    move-result v3

    goto :goto_0

    .line 186
    :sswitch_0
    sget-object v3, Lorg/jboss/netty/handler/codec/http/HttpMethod;->HEAD:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-virtual {v3, v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    move v3, v4

    .line 187
    goto :goto_0

    .line 205
    :sswitch_1
    const/16 v3, 0xc8

    if-ne v2, v3, :cond_1

    .line 206
    sget-object v3, Lorg/jboss/netty/handler/codec/http/HttpMethod;->CONNECT:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-virtual {v3, v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 208
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Decoder;->this$0:Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    iput-boolean v4, v3, Lorg/jboss/netty/handler/codec/http/HttpClientCodec;->done:Z

    .line 209
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/HttpClientCodec$Decoder;->this$0:Lorg/jboss/netty/handler/codec/http/HttpClientCodec;

    iget-object v3, v3, Lorg/jboss/netty/handler/codec/http/HttpClientCodec;->queue:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->clear()V

    move v3, v4

    .line 210
    goto :goto_0

    .line 180
    :sswitch_data_0
    .sparse-switch
        0x43 -> :sswitch_1
        0x48 -> :sswitch_0
    .end sparse-switch
.end method
