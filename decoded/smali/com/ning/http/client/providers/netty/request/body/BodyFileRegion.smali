.class public Lcom/ning/http/client/providers/netty/request/body/BodyFileRegion;
.super Ljava/lang/Object;
.source "BodyFileRegion.java"

# interfaces
.implements Lorg/jboss/netty/channel/FileRegion;


# instance fields
.field private final body:Lcom/ning/http/client/RandomAccessBody;


# direct methods
.method public constructor <init>(Lcom/ning/http/client/RandomAccessBody;)V
    .locals 2
    .param p1, "body"    # Lcom/ning/http/client/RandomAccessBody;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    if-nez p1, :cond_0

    .line 33
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "body"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 34
    :cond_0
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/request/body/BodyFileRegion;->body:Lcom/ning/http/client/RandomAccessBody;

    .line 35
    return-void
.end method


# virtual methods
.method public getCount()J
    .locals 2

    .prologue
    .line 42
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/BodyFileRegion;->body:Lcom/ning/http/client/RandomAccessBody;

    invoke-interface {v0}, Lcom/ning/http/client/RandomAccessBody;->getContentLength()J

    move-result-wide v0

    return-wide v0
.end method

.method public getPosition()J
    .locals 2

    .prologue
    .line 38
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public releaseExternalResources()V
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/BodyFileRegion;->body:Lcom/ning/http/client/RandomAccessBody;

    invoke-static {v0}, Lcom/ning/http/util/MiscUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 52
    return-void
.end method

.method public transferTo(Ljava/nio/channels/WritableByteChannel;J)J
    .locals 2
    .param p1, "target"    # Ljava/nio/channels/WritableByteChannel;
    .param p2, "position"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/BodyFileRegion;->body:Lcom/ning/http/client/RandomAccessBody;

    invoke-interface {v0, p2, p3, p1}, Lcom/ning/http/client/RandomAccessBody;->transferTo(JLjava/nio/channels/WritableByteChannel;)J

    move-result-wide v0

    return-wide v0
.end method
