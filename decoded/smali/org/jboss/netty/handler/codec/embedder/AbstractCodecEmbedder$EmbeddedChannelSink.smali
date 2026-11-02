.class final Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelSink;
.super Ljava/lang/Object;
.source "AbstractCodecEmbedder.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelSink;
.implements Lorg/jboss/netty/channel/ChannelUpstreamHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "EmbeddedChannelSink"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 185
    const-class v0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelSink;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;)V
    .locals 0

    .prologue
    .line 186
    .local p0, "this":Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelSink;, "Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder<TE;>.EmbeddedChannelSink;"
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelSink;->this$0:Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 187
    return-void
.end method

.method private handleEvent(Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 3
    .param p1, "e"    # Lorg/jboss/netty/channel/ChannelEvent;

    .prologue
    .line 198
    .local p0, "this":Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelSink;, "Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder<TE;>.EmbeddedChannelSink;"
    instance-of v1, p1, Lorg/jboss/netty/channel/MessageEvent;

    if-eqz v1, :cond_0

    .line 199
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelSink;->this$0:Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;

    iget-object v1, v1, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->productQueue:Ljava/util/Queue;

    check-cast p1, Lorg/jboss/netty/channel/MessageEvent;

    .end local p1    # "e":Lorg/jboss/netty/channel/ChannelEvent;
    invoke-interface {p1}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    move-result v0

    .line 200
    .local v0, "offered":Z
    sget-boolean v1, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelSink;->$assertionsDisabled:Z

    if-nez v1, :cond_1

    if-nez v0, :cond_1

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 201
    .end local v0    # "offered":Z
    .restart local p1    # "e":Lorg/jboss/netty/channel/ChannelEvent;
    :cond_0
    instance-of v1, p1, Lorg/jboss/netty/channel/ExceptionEvent;

    if-eqz v1, :cond_1

    .line 202
    new-instance v1, Lorg/jboss/netty/handler/codec/embedder/CodecEmbedderException;

    check-cast p1, Lorg/jboss/netty/channel/ExceptionEvent;

    .end local p1    # "e":Lorg/jboss/netty/channel/ChannelEvent;
    invoke-interface {p1}, Lorg/jboss/netty/channel/ExceptionEvent;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jboss/netty/handler/codec/embedder/CodecEmbedderException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 206
    :cond_1
    return-void
.end method


# virtual methods
.method public eventSunk(Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 0
    .param p1, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;

    .prologue
    .line 194
    .local p0, "this":Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelSink;, "Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder<TE;>.EmbeddedChannelSink;"
    invoke-direct {p0, p2}, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelSink;->handleEvent(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 195
    return-void
.end method

.method public exceptionCaught(Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelEvent;Lorg/jboss/netty/channel/ChannelPipelineException;)V
    .locals 2
    .param p1, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .param p3, "cause"    # Lorg/jboss/netty/channel/ChannelPipelineException;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 211
    .local p0, "this":Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelSink;, "Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder<TE;>.EmbeddedChannelSink;"
    invoke-virtual {p3}, Lorg/jboss/netty/channel/ChannelPipelineException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 212
    .local v0, "actualCause":Ljava/lang/Throwable;
    if-nez v0, :cond_0

    .line 213
    move-object v0, p3

    .line 216
    :cond_0
    new-instance v1, Lorg/jboss/netty/handler/codec/embedder/CodecEmbedderException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/handler/codec/embedder/CodecEmbedderException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public execute(Lorg/jboss/netty/channel/ChannelPipeline;Ljava/lang/Runnable;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 2
    .param p1, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p2, "task"    # Ljava/lang/Runnable;

    .prologue
    .line 221
    .local p0, "this":Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelSink;, "Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder<TE;>.EmbeddedChannelSink;"
    :try_start_0
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 222
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelPipeline;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    invoke-static {v1}, Lorg/jboss/netty/channel/Channels;->succeededFuture(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 224
    :goto_0
    return-object v1

    .line 223
    :catch_0
    move-exception v0

    .line 224
    .local v0, "t":Ljava/lang/Throwable;
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelPipeline;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    invoke-static {v1, v0}, Lorg/jboss/netty/channel/Channels;->failedFuture(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    goto :goto_0
.end method

.method public handleUpstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;

    .prologue
    .line 190
    .local p0, "this":Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelSink;, "Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder<TE;>.EmbeddedChannelSink;"
    invoke-direct {p0, p2}, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelSink;->handleEvent(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 191
    return-void
.end method
