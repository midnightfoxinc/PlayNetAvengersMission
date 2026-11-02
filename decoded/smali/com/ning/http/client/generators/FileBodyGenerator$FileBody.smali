.class public Lcom/ning/http/client/generators/FileBodyGenerator$FileBody;
.super Ljava/lang/Object;
.source "FileBodyGenerator.java"

# interfaces
.implements Lcom/ning/http/client/RandomAccessBody;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/generators/FileBodyGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "FileBody"
.end annotation


# instance fields
.field private final channel:Ljava/nio/channels/FileChannel;

.field private final file:Ljava/io/RandomAccessFile;

.field private final length:J


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v1, "r"

    invoke-direct {v0, p1, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/ning/http/client/generators/FileBodyGenerator$FileBody;->file:Ljava/io/RandomAccessFile;

    .line 81
    iget-object v0, p0, Lcom/ning/http/client/generators/FileBodyGenerator$FileBody;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/generators/FileBodyGenerator$FileBody;->channel:Ljava/nio/channels/FileChannel;

    .line 82
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ning/http/client/generators/FileBodyGenerator$FileBody;->length:J

    .line 83
    return-void
.end method

.method public constructor <init>(Ljava/io/File;JJ)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;
    .param p2, "regionSeek"    # J
    .param p4, "regionLength"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v1, "r"

    invoke-direct {v0, p1, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/ning/http/client/generators/FileBodyGenerator$FileBody;->file:Ljava/io/RandomAccessFile;

    .line 88
    iget-object v0, p0, Lcom/ning/http/client/generators/FileBodyGenerator$FileBody;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/generators/FileBodyGenerator$FileBody;->channel:Ljava/nio/channels/FileChannel;

    .line 89
    iput-wide p4, p0, Lcom/ning/http/client/generators/FileBodyGenerator$FileBody;->length:J

    .line 90
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-lez v0, :cond_0

    .line 91
    iget-object v0, p0, Lcom/ning/http/client/generators/FileBodyGenerator$FileBody;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p2, p3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 93
    :cond_0
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 114
    iget-object v0, p0, Lcom/ning/http/client/generators/FileBodyGenerator$FileBody;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 115
    return-void
.end method

.method public getContentLength()J
    .locals 2

    .prologue
    .line 97
    iget-wide v0, p0, Lcom/ning/http/client/generators/FileBodyGenerator$FileBody;->length:J

    return-wide v0
.end method

.method public read(Ljava/nio/ByteBuffer;)J
    .locals 2
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    iget-object v0, p0, Lcom/ning/http/client/generators/FileBodyGenerator$FileBody;->channel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v0, p1}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public transferTo(JLjava/nio/channels/WritableByteChannel;)J
    .locals 7
    .param p1, "position"    # J
    .param p3, "target"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 109
    iget-object v1, p0, Lcom/ning/http/client/generators/FileBodyGenerator$FileBody;->channel:Ljava/nio/channels/FileChannel;

    iget-wide v4, p0, Lcom/ning/http/client/generators/FileBodyGenerator$FileBody;->length:J

    move-wide v2, p1

    move-object v6, p3

    invoke-virtual/range {v1 .. v6}, Ljava/nio/channels/FileChannel;->transferTo(JJLjava/nio/channels/WritableByteChannel;)J

    move-result-wide v0

    return-wide v0
.end method
