.class final Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelPipeline;
.super Lorg/jboss/netty/channel/DefaultChannelPipeline;
.source "AbstractCodecEmbedder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "EmbeddedChannelPipeline"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 231
    invoke-direct {p0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;-><init>()V

    .line 232
    return-void
.end method


# virtual methods
.method protected notifyHandlerException(Lorg/jboss/netty/channel/ChannelEvent;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 236
    :goto_0
    instance-of v0, p2, Lorg/jboss/netty/channel/ChannelPipelineException;

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 237
    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p2

    goto :goto_0

    .line 239
    :cond_0
    instance-of v0, p2, Lorg/jboss/netty/handler/codec/embedder/CodecEmbedderException;

    if-eqz v0, :cond_1

    .line 240
    check-cast p2, Lorg/jboss/netty/handler/codec/embedder/CodecEmbedderException;

    .end local p2    # "t":Ljava/lang/Throwable;
    throw p2

    .line 242
    .restart local p2    # "t":Ljava/lang/Throwable;
    :cond_1
    new-instance v0, Lorg/jboss/netty/handler/codec/embedder/CodecEmbedderException;

    invoke-direct {v0, p2}, Lorg/jboss/netty/handler/codec/embedder/CodecEmbedderException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method
