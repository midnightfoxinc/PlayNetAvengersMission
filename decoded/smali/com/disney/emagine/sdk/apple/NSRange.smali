.class public Lcom/disney/emagine/sdk/apple/NSRange;
.super Ljava/lang/Object;
.source "NSRange.java"


# instance fields
.field public length:J

.field public location:J


# direct methods
.method public constructor <init>(II)V
    .locals 2
    .param p1, "start"    # I
    .param p2, "size"    # I

    .prologue
    const-wide/16 v0, 0x0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-wide v0, p0, Lcom/disney/emagine/sdk/apple/NSRange;->location:J

    .line 15
    iput-wide v0, p0, Lcom/disney/emagine/sdk/apple/NSRange;->length:J

    .line 25
    int-to-long v0, p1

    iput-wide v0, p0, Lcom/disney/emagine/sdk/apple/NSRange;->location:J

    .line 26
    int-to-long v0, p2

    iput-wide v0, p0, Lcom/disney/emagine/sdk/apple/NSRange;->length:J

    .line 27
    return-void
.end method

.method public constructor <init>(JJ)V
    .locals 3
    .param p1, "start"    # J
    .param p3, "size"    # J

    .prologue
    const-wide/16 v0, 0x0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-wide v0, p0, Lcom/disney/emagine/sdk/apple/NSRange;->location:J

    .line 15
    iput-wide v0, p0, Lcom/disney/emagine/sdk/apple/NSRange;->length:J

    .line 19
    iput-wide p1, p0, Lcom/disney/emagine/sdk/apple/NSRange;->location:J

    .line 20
    iput-wide p3, p0, Lcom/disney/emagine/sdk/apple/NSRange;->length:J

    .line 21
    return-void
.end method


# virtual methods
.method public end()J
    .locals 4

    .prologue
    .line 36
    iget-wide v0, p0, Lcom/disney/emagine/sdk/apple/NSRange;->location:J

    iget-wide v2, p0, Lcom/disney/emagine/sdk/apple/NSRange;->length:J

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public start()J
    .locals 2

    .prologue
    .line 31
    iget-wide v0, p0, Lcom/disney/emagine/sdk/apple/NSRange;->location:J

    return-wide v0
.end method
