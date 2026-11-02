.class final Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$EmptySendBuffer;
.super Ljava/lang/Object;
.source "SocketSendBufferPool.java"

# interfaces
.implements Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "EmptySendBuffer"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 351
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public finished()Z
    .locals 1

    .prologue
    .line 354
    const/4 v0, 0x1

    return v0
.end method

.method public release()V
    .locals 0

    .prologue
    .line 375
    return-void
.end method

.method public totalBytes()J
    .locals 2

    .prologue
    .line 362
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public transferTo(Ljava/nio/channels/DatagramChannel;Ljava/net/SocketAddress;)J
    .locals 2
    .param p1, "ch"    # Ljava/nio/channels/DatagramChannel;
    .param p2, "raddr"    # Ljava/net/SocketAddress;

    .prologue
    .line 370
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public transferTo(Ljava/nio/channels/WritableByteChannel;)J
    .locals 2
    .param p1, "ch"    # Ljava/nio/channels/WritableByteChannel;

    .prologue
    .line 366
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public writtenBytes()J
    .locals 2

    .prologue
    .line 358
    const-wide/16 v0, 0x0

    return-wide v0
.end method
