.class Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;
.super Ljava/lang/Object;
.source "LimitingByteInput.java"

# interfaces
.implements Lorg/jboss/marshalling/ByteInput;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput$TooBigObjectException;
    }
.end annotation


# static fields
.field private static final EXCEPTION:Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput$TooBigObjectException;


# instance fields
.field private final input:Lorg/jboss/marshalling/ByteInput;

.field private final limit:J

.field private read:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    new-instance v0, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput$TooBigObjectException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput$TooBigObjectException;-><init>()V

    sput-object v0, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->EXCEPTION:Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput$TooBigObjectException;

    return-void
.end method

.method public constructor <init>(Lorg/jboss/marshalling/ByteInput;J)V
    .locals 2
    .param p1, "input"    # Lorg/jboss/marshalling/ByteInput;
    .param p2, "limit"    # J

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-gtz v0, :cond_0

    .line 39
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The limit MUST be > 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 41
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->input:Lorg/jboss/marshalling/ByteInput;

    .line 42
    iput-wide p2, p0, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->limit:J

    .line 43
    return-void
.end method

.method private readable(I)I
    .locals 6
    .param p1, "length"    # I

    .prologue
    .line 93
    int-to-long v0, p1

    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->limit:J

    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->read:J

    sub-long/2addr v2, v4

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method


# virtual methods
.method public available()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->input:Lorg/jboss/marshalling/ByteInput;

    invoke-interface {v2}, Lorg/jboss/marshalling/ByteInput;->available()I

    move-result v0

    .line 51
    .local v0, "available":I
    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->readable(I)I

    move-result v1

    .line 52
    .local v1, "readable":I
    return v1
.end method

.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    return-void
.end method

.method public read()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->readable(I)I

    move-result v1

    .line 57
    .local v1, "readable":I
    if-lez v1, :cond_0

    .line 58
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->input:Lorg/jboss/marshalling/ByteInput;

    invoke-interface {v2}, Lorg/jboss/marshalling/ByteInput;->read()I

    move-result v0

    .line 59
    .local v0, "b":I
    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->read:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->read:J

    .line 60
    return v0

    .line 62
    .end local v0    # "b":I
    :cond_0
    sget-object v2, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->EXCEPTION:Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput$TooBigObjectException;

    throw v2
.end method

.method public read([B)I
    .locals 2
    .param p1, "array"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 6
    .param p1, "array"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    invoke-direct {p0, p3}, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->readable(I)I

    move-result v1

    .line 72
    .local v1, "readable":I
    if-lez v1, :cond_0

    .line 73
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->input:Lorg/jboss/marshalling/ByteInput;

    invoke-interface {v2, p1, p2, v1}, Lorg/jboss/marshalling/ByteInput;->read([BII)I

    move-result v0

    .line 74
    .local v0, "i":I
    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->read:J

    int-to-long v4, v0

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->read:J

    .line 75
    return v0

    .line 77
    .end local v0    # "i":I
    :cond_0
    sget-object v2, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->EXCEPTION:Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput$TooBigObjectException;

    throw v2
.end method

.method public skip(J)J
    .locals 7
    .param p1, "bytes"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    long-to-int v3, p1

    invoke-direct {p0, v3}, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->readable(I)I

    move-result v2

    .line 83
    .local v2, "readable":I
    if-lez v2, :cond_0

    .line 84
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->input:Lorg/jboss/marshalling/ByteInput;

    int-to-long v4, v2

    invoke-interface {v3, v4, v5}, Lorg/jboss/marshalling/ByteInput;->skip(J)J

    move-result-wide v0

    .line 85
    .local v0, "i":J
    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->read:J

    add-long/2addr v4, v0

    iput-wide v4, p0, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->read:J

    .line 86
    return-wide v0

    .line 88
    .end local v0    # "i":J
    :cond_0
    sget-object v3, Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput;->EXCEPTION:Lorg/jboss/netty/handler/codec/marshalling/LimitingByteInput$TooBigObjectException;

    throw v3
.end method
