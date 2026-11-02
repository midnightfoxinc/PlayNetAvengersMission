.class public Lorg/jboss/netty/buffer/EmptyChannelBuffer;
.super Lorg/jboss/netty/buffer/BigEndianHeapChannelBuffer;
.source "EmptyChannelBuffer.java"


# static fields
.field private static final BUFFER:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->BUFFER:[B

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 40
    sget-object v0, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->BUFFER:[B

    invoke-direct {p0, v0}, Lorg/jboss/netty/buffer/BigEndianHeapChannelBuffer;-><init>([B)V

    .line 41
    return-void
.end method

.method private checkWritableBytes(I)V
    .locals 3
    .param p1, "length"    # I

    .prologue
    .line 191
    if-nez p1, :cond_0

    .line 192
    return-void

    .line 194
    :cond_0
    if-lez p1, :cond_1

    .line 195
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Writable bytes exceeded - Need "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", maximum is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 198
    :cond_1
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "length < 0"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method protected checkReadableBytes(I)V
    .locals 3
    .param p1, "length"    # I

    .prologue
    .line 206
    if-nez p1, :cond_0

    .line 207
    return-void

    .line 209
    :cond_0
    if-lez p1, :cond_1

    .line 210
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Not enough readable bytes - Need "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", maximum is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->readableBytes()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 213
    :cond_1
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "length < 0"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public clear()V
    .locals 0

    .prologue
    .line 45
    return-void
.end method

.method public discardReadBytes()V
    .locals 0

    .prologue
    .line 90
    return-void
.end method

.method public markReaderIndex()V
    .locals 0

    .prologue
    .line 74
    return-void
.end method

.method public markWriterIndex()V
    .locals 0

    .prologue
    .line 82
    return-void
.end method

.method public readBytes(Ljava/nio/channels/GatheringByteChannel;I)I
    .locals 1
    .param p1, "out"    # Ljava/nio/channels/GatheringByteChannel;
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 136
    invoke-virtual {p0, p2}, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->checkReadableBytes(I)V

    .line 137
    const/4 v0, 0x0

    return v0
.end method

.method public readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 0
    .param p1, "length"    # I

    .prologue
    .line 94
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->checkReadableBytes(I)V

    .line 95
    return-object p0
.end method

.method public readBytes(Ljava/io/OutputStream;I)V
    .locals 0
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 142
    invoke-virtual {p0, p2}, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->checkReadableBytes(I)V

    .line 143
    return-void
.end method

.method public readBytes(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "dst"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 131
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->checkReadableBytes(I)V

    .line 132
    return-void
.end method

.method public readBytes(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 1
    .param p1, "dst"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 116
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writableBytes()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->checkReadableBytes(I)V

    .line 117
    return-void
.end method

.method public readBytes(Lorg/jboss/netty/buffer/ChannelBuffer;I)V
    .locals 0
    .param p1, "dst"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "length"    # I

    .prologue
    .line 121
    invoke-virtual {p0, p2}, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->checkReadableBytes(I)V

    .line 122
    return-void
.end method

.method public readBytes(Lorg/jboss/netty/buffer/ChannelBuffer;II)V
    .locals 0
    .param p1, "dst"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "dstIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 126
    invoke-virtual {p0, p3}, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->checkReadableBytes(I)V

    .line 127
    return-void
.end method

.method public readBytes([B)V
    .locals 1
    .param p1, "dst"    # [B

    .prologue
    .line 111
    array-length v0, p1

    invoke-virtual {p0, v0}, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->checkReadableBytes(I)V

    .line 112
    return-void
.end method

.method public readBytes([BII)V
    .locals 0
    .param p1, "dst"    # [B
    .param p2, "dstIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 106
    invoke-virtual {p0, p3}, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->checkReadableBytes(I)V

    .line 107
    return-void
.end method

.method public readSlice(I)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 0
    .param p1, "length"    # I

    .prologue
    .line 100
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->checkReadableBytes(I)V

    .line 101
    return-object p0
.end method

.method public readerIndex(I)V
    .locals 3
    .param p1, "readerIndex"    # I

    .prologue
    .line 49
    if-eqz p1, :cond_0

    .line 50
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid readerIndex: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " - Maximum is 0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 53
    :cond_0
    return-void
.end method

.method public resetReaderIndex()V
    .locals 0

    .prologue
    .line 78
    return-void
.end method

.method public resetWriterIndex()V
    .locals 0

    .prologue
    .line 86
    return-void
.end method

.method public setIndex(II)V
    .locals 3
    .param p1, "readerIndex"    # I
    .param p2, "writerIndex"    # I

    .prologue
    .line 65
    if-nez p2, :cond_0

    if-eqz p1, :cond_1

    .line 66
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid writerIndex: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " - Maximum is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " or "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->capacity()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 70
    :cond_1
    return-void
.end method

.method public skipBytes(I)V
    .locals 0
    .param p1, "length"    # I

    .prologue
    .line 147
    invoke-virtual {p0, p1}, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->checkReadableBytes(I)V

    .line 148
    return-void
.end method

.method public writeBytes(Ljava/io/InputStream;I)I
    .locals 1
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 172
    invoke-direct {p0, p2}, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->checkWritableBytes(I)V

    .line 173
    const/4 v0, 0x0

    return v0
.end method

.method public writeBytes(Ljava/nio/channels/ScatteringByteChannel;I)I
    .locals 1
    .param p1, "in"    # Ljava/nio/channels/ScatteringByteChannel;
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 178
    invoke-direct {p0, p2}, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->checkWritableBytes(I)V

    .line 179
    const/4 v0, 0x0

    return v0
.end method

.method public writeBytes(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "src"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 167
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-direct {p0, v0}, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->checkWritableBytes(I)V

    .line 168
    return-void
.end method

.method public writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;I)V
    .locals 0
    .param p1, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "length"    # I

    .prologue
    .line 157
    invoke-direct {p0, p2}, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->checkWritableBytes(I)V

    .line 158
    return-void
.end method

.method public writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;II)V
    .locals 0
    .param p1, "src"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "srcIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 162
    invoke-direct {p0, p3}, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->checkWritableBytes(I)V

    .line 163
    return-void
.end method

.method public writeBytes([BII)V
    .locals 0
    .param p1, "src"    # [B
    .param p2, "srcIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 152
    invoke-direct {p0, p3}, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->checkWritableBytes(I)V

    .line 153
    return-void
.end method

.method public writeZero(I)V
    .locals 0
    .param p1, "length"    # I

    .prologue
    .line 184
    invoke-direct {p0, p1}, Lorg/jboss/netty/buffer/EmptyChannelBuffer;->checkWritableBytes(I)V

    .line 185
    return-void
.end method

.method public writerIndex(I)V
    .locals 3
    .param p1, "writerIndex"    # I

    .prologue
    .line 57
    if-eqz p1, :cond_0

    .line 58
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid writerIndex: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " - Maximum is 0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 61
    :cond_0
    return-void
.end method
