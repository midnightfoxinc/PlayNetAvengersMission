.class public Lcom/ning/http/client/extra/ResumableRandomAccessFileListener;
.super Ljava/lang/Object;
.source "ResumableRandomAccessFileListener.java"

# interfaces
.implements Lcom/ning/http/client/resumable/ResumableListener;


# instance fields
.field private final file:Ljava/io/RandomAccessFile;


# direct methods
.method public constructor <init>(Ljava/io/RandomAccessFile;)V
    .locals 0
    .param p1, "file"    # Ljava/io/RandomAccessFile;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/ning/http/client/extra/ResumableRandomAccessFileListener;->file:Ljava/io/RandomAccessFile;

    .line 31
    return-void
.end method


# virtual methods
.method public length()J
    .locals 2

    .prologue
    .line 53
    :try_start_0
    iget-object v0, p0, Lcom/ning/http/client/extra/ResumableRandomAccessFileListener;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->length()J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v0

    .line 56
    :goto_0
    return-wide v0

    .line 54
    :catch_0
    move-exception v0

    .line 56
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public onAllBytesReceived()V
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/ning/http/client/extra/ResumableRandomAccessFileListener;->file:Ljava/io/RandomAccessFile;

    invoke-static {v0}, Lcom/ning/http/util/MiscUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 49
    return-void
.end method

.method public onBytesReceived(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    iget-object v0, p0, Lcom/ning/http/client/extra/ResumableRandomAccessFileListener;->file:Ljava/io/RandomAccessFile;

    iget-object v1, p0, Lcom/ning/http/client/extra/ResumableRandomAccessFileListener;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 43
    iget-object v0, p0, Lcom/ning/http/client/extra/ResumableRandomAccessFileListener;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/RandomAccessFile;->write([B)V

    .line 44
    return-void
.end method
