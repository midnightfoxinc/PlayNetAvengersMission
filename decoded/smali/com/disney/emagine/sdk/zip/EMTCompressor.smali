.class public Lcom/disney/emagine/sdk/zip/EMTCompressor;
.super Ljava/lang/Object;
.source "EMTCompressor.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static compressSource([B)[B
    .locals 8
    .param p0, "source"    # [B

    .prologue
    .line 29
    new-instance v3, Ljava/util/zip/Deflater;

    invoke-direct {v3}, Ljava/util/zip/Deflater;-><init>()V

    .line 37
    .local v3, "deflater":Ljava/util/zip/Deflater;
    invoke-virtual {v3, p0}, Ljava/util/zip/Deflater;->setInput([B)V

    .line 47
    invoke-virtual {v3}, Ljava/util/zip/Deflater;->finish()V

    .line 54
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    array-length v5, p0

    invoke-direct {v0, v5}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 56
    .local v0, "bos":Ljava/io/ByteArrayOutputStream;
    const/16 v5, 0x400

    new-array v1, v5, [B

    .line 66
    .local v1, "buffer":[B
    :goto_0
    invoke-virtual {v3}, Ljava/util/zip/Deflater;->finished()Z

    move-result v5

    if-nez v5, :cond_0

    .line 76
    invoke-virtual {v3, v1}, Ljava/util/zip/Deflater;->deflate([B)I

    move-result v2

    .line 78
    .local v2, "bytesCompressed":I
    const/4 v5, 0x0

    invoke-virtual {v0, v1, v5, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 84
    .end local v2    # "bytesCompressed":I
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    :goto_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    return-object v5

    .line 86
    :catch_0
    move-exception v4

    .line 88
    .local v4, "e":Ljava/io/IOException;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error while closing the stream : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Ljava/io/IOException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public static decompressSource([B)[B
    .locals 8
    .param p0, "source"    # [B

    .prologue
    .line 105
    new-instance v4, Ljava/util/zip/Inflater;

    invoke-direct {v4}, Ljava/util/zip/Inflater;-><init>()V

    .line 113
    .local v4, "inflater":Ljava/util/zip/Inflater;
    invoke-virtual {v4, p0}, Ljava/util/zip/Inflater;->setInput([B)V

    .line 120
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    array-length v5, p0

    invoke-direct {v0, v5}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 122
    .local v0, "bos":Ljava/io/ByteArrayOutputStream;
    const/16 v5, 0x400

    new-array v1, v5, [B

    .line 132
    .local v1, "buffer":[B
    :goto_0
    invoke-virtual {v4}, Ljava/util/zip/Inflater;->finished()Z

    move-result v5

    if-nez v5, :cond_0

    .line 142
    const/4 v2, 0x0

    .line 146
    .local v2, "bytesDecompressed":I
    :try_start_0
    invoke-virtual {v4, v1}, Ljava/util/zip/Inflater;->inflate([B)I
    :try_end_0
    .catch Ljava/util/zip/DataFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 153
    :goto_1
    const/4 v5, 0x0

    invoke-virtual {v0, v1, v5, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 148
    :catch_0
    move-exception v3

    .line 150
    .local v3, "e":Ljava/util/zip/DataFormatException;
    invoke-virtual {v3}, Ljava/util/zip/DataFormatException;->printStackTrace()V

    goto :goto_1

    .line 159
    .end local v2    # "bytesDecompressed":I
    .end local v3    # "e":Ljava/util/zip/DataFormatException;
    :cond_0
    :try_start_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 167
    :goto_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    return-object v5

    .line 161
    :catch_1
    move-exception v3

    .line 163
    .local v3, "e":Ljava/io/IOException;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error while closing the stream : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Ljava/io/IOException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2
.end method
