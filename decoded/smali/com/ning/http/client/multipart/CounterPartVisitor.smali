.class public Lcom/ning/http/client/multipart/CounterPartVisitor;
.super Ljava/lang/Object;
.source "CounterPartVisitor.java"

# interfaces
.implements Lcom/ning/http/client/multipart/PartVisitor;


# instance fields
.field private count:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/ning/http/client/multipart/CounterPartVisitor;->count:J

    return-void
.end method


# virtual methods
.method public getCount()J
    .locals 2

    .prologue
    .line 30
    iget-wide v0, p0, Lcom/ning/http/client/multipart/CounterPartVisitor;->count:J

    return-wide v0
.end method

.method public withByte(B)V
    .locals 4
    .param p1, "b"    # B

    .prologue
    .line 26
    iget-wide v0, p0, Lcom/ning/http/client/multipart/CounterPartVisitor;->count:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/ning/http/client/multipart/CounterPartVisitor;->count:J

    .line 27
    return-void
.end method

.method public withBytes([B)V
    .locals 4
    .param p1, "bytes"    # [B

    .prologue
    .line 21
    iget-wide v0, p0, Lcom/ning/http/client/multipart/CounterPartVisitor;->count:J

    array-length v2, p1

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/ning/http/client/multipart/CounterPartVisitor;->count:J

    .line 22
    return-void
.end method
