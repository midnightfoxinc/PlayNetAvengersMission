.class final Lorg/jboss/netty/buffer/ChannelBufferIndexFinder$7;
.super Ljava/lang/Object;
.source "ChannelBufferIndexFinder.java"

# interfaces
.implements Lorg/jboss/netty/buffer/ChannelBufferIndexFinder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/buffer/ChannelBufferIndexFinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public find(Lorg/jboss/netty/buffer/ChannelBuffer;I)Z
    .locals 2
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "guessedIndex"    # I

    .prologue
    .line 101
    invoke-interface {p1, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v0

    .line 102
    .local v0, "b":B
    const/16 v1, 0xd

    if-eq v0, v1, :cond_0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
