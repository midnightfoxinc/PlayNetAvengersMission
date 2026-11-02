.class public Lcom/ning/http/client/providers/netty/request/body/OptimizedFileRegion;
.super Ljava/lang/Object;
.source "OptimizedFileRegion.java"

# interfaces
.implements Lorg/jboss/netty/channel/FileRegion;


# instance fields
.field private byteWritten:J

.field private final count:J

.field private final file:Ljava/nio/channels/FileChannel;

.field private final position:J

.field private final raf:Ljava/io/RandomAccessFile;


# direct methods
.method public constructor <init>(Ljava/io/RandomAccessFile;JJ)V
    .locals 2
    .param p1, "raf"    # Ljava/io/RandomAccessFile;
    .param p2, "position"    # J
    .param p4, "count"    # J

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/request/body/OptimizedFileRegion;->raf:Ljava/io/RandomAccessFile;

    .line 35
    invoke-virtual {p1}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/OptimizedFileRegion;->file:Ljava/nio/channels/FileChannel;

    .line 36
    iput-wide p2, p0, Lcom/ning/http/client/providers/netty/request/body/OptimizedFileRegion;->position:J

    .line 37
    iput-wide p4, p0, Lcom/ning/http/client/providers/netty/request/body/OptimizedFileRegion;->count:J

    .line 38
    return-void
.end method


# virtual methods
.method public getCount()J
    .locals 2

    .prologue
    .line 45
    iget-wide v0, p0, Lcom/ning/http/client/providers/netty/request/body/OptimizedFileRegion;->count:J

    return-wide v0
.end method

.method public getPosition()J
    .locals 2

    .prologue
    .line 41
    iget-wide v0, p0, Lcom/ning/http/client/providers/netty/request/body/OptimizedFileRegion;->position:J

    return-wide v0
.end method

.method public releaseExternalResources()V
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/OptimizedFileRegion;->file:Ljava/nio/channels/FileChannel;

    invoke-static {v0}, Lcom/ning/http/util/MiscUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 67
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/OptimizedFileRegion;->raf:Ljava/io/RandomAccessFile;

    invoke-static {v0}, Lcom/ning/http/util/MiscUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 68
    return-void
.end method

.method public transferTo(Ljava/nio/channels/WritableByteChannel;J)J
    .locals 10
    .param p1, "target"    # Ljava/nio/channels/WritableByteChannel;
    .param p2, "position"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x0

    .line 49
    iget-wide v0, p0, Lcom/ning/http/client/providers/netty/request/body/OptimizedFileRegion;->count:J

    sub-long v4, v0, p2

    .line 50
    .local v4, "count":J
    cmp-long v0, v4, v8

    if-ltz v0, :cond_0

    cmp-long v0, p2, v8

    if-gez v0, :cond_1

    .line 51
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "position out of range: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (expected: 0 - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/ning/http/client/providers/netty/request/body/OptimizedFileRegion;->count:J

    const-wide/16 v6, 0x1

    sub-long/2addr v2, v6

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 53
    :cond_1
    cmp-long v0, v4, v8

    if-nez v0, :cond_3

    .line 62
    :cond_2
    :goto_0
    return-wide v8

    .line 57
    :cond_3
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/request/body/OptimizedFileRegion;->file:Ljava/nio/channels/FileChannel;

    iget-wide v2, p0, Lcom/ning/http/client/providers/netty/request/body/OptimizedFileRegion;->position:J

    add-long/2addr v2, p2

    move-object v6, p1

    invoke-virtual/range {v1 .. v6}, Ljava/nio/channels/FileChannel;->transferTo(JJLjava/nio/channels/WritableByteChannel;)J

    move-result-wide v8

    .line 58
    .local v8, "bw":J
    iget-wide v0, p0, Lcom/ning/http/client/providers/netty/request/body/OptimizedFileRegion;->byteWritten:J

    add-long/2addr v0, v8

    iput-wide v0, p0, Lcom/ning/http/client/providers/netty/request/body/OptimizedFileRegion;->byteWritten:J

    .line 59
    iget-wide v0, p0, Lcom/ning/http/client/providers/netty/request/body/OptimizedFileRegion;->byteWritten:J

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/request/body/OptimizedFileRegion;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_2

    .line 60
    invoke-virtual {p0}, Lcom/ning/http/client/providers/netty/request/body/OptimizedFileRegion;->releaseExternalResources()V

    goto :goto_0
.end method
