.class public Lcom/ning/http/client/generators/FileBodyGenerator;
.super Ljava/lang/Object;
.source "FileBodyGenerator.java"

# interfaces
.implements Lcom/ning/http/client/BodyGenerator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/generators/FileBodyGenerator$FileBody;
    }
.end annotation


# instance fields
.field private final file:Ljava/io/File;

.field private final regionLength:J

.field private final regionSeek:J


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    if-nez p1, :cond_0

    .line 37
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "file"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 38
    :cond_0
    iput-object p1, p0, Lcom/ning/http/client/generators/FileBodyGenerator;->file:Ljava/io/File;

    .line 39
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ning/http/client/generators/FileBodyGenerator;->regionLength:J

    .line 40
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/ning/http/client/generators/FileBodyGenerator;->regionSeek:J

    .line 41
    return-void
.end method

.method public constructor <init>(Ljava/io/File;JJ)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;
    .param p2, "regionSeek"    # J
    .param p4, "regionLength"    # J

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    if-nez p1, :cond_0

    .line 45
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "file"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 46
    :cond_0
    iput-object p1, p0, Lcom/ning/http/client/generators/FileBodyGenerator;->file:Ljava/io/File;

    .line 47
    iput-wide p4, p0, Lcom/ning/http/client/generators/FileBodyGenerator;->regionLength:J

    .line 48
    iput-wide p2, p0, Lcom/ning/http/client/generators/FileBodyGenerator;->regionSeek:J

    .line 49
    return-void
.end method


# virtual methods
.method public bridge synthetic createBody()Lcom/ning/http/client/Body;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 29
    invoke-virtual {p0}, Lcom/ning/http/client/generators/FileBodyGenerator;->createBody()Lcom/ning/http/client/RandomAccessBody;

    move-result-object v0

    return-object v0
.end method

.method public createBody()Lcom/ning/http/client/RandomAccessBody;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    new-instance v0, Lcom/ning/http/client/generators/FileBodyGenerator$FileBody;

    iget-object v1, p0, Lcom/ning/http/client/generators/FileBodyGenerator;->file:Ljava/io/File;

    iget-wide v2, p0, Lcom/ning/http/client/generators/FileBodyGenerator;->regionSeek:J

    iget-wide v4, p0, Lcom/ning/http/client/generators/FileBodyGenerator;->regionLength:J

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/generators/FileBodyGenerator$FileBody;-><init>(Ljava/io/File;JJ)V

    return-object v0
.end method

.method public getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/ning/http/client/generators/FileBodyGenerator;->file:Ljava/io/File;

    return-object v0
.end method

.method public getRegionLength()J
    .locals 2

    .prologue
    .line 66
    iget-wide v0, p0, Lcom/ning/http/client/generators/FileBodyGenerator;->regionLength:J

    return-wide v0
.end method

.method public getRegionSeek()J
    .locals 2

    .prologue
    .line 62
    iget-wide v0, p0, Lcom/ning/http/client/generators/FileBodyGenerator;->regionSeek:J

    return-wide v0
.end method
