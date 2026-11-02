.class public Lcom/ning/http/client/multipart/OutputStreamPartVisitor;
.super Ljava/lang/Object;
.source "OutputStreamPartVisitor.java"

# interfaces
.implements Lcom/ning/http/client/multipart/PartVisitor;


# instance fields
.field private final out:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 0
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/ning/http/client/multipart/OutputStreamPartVisitor;->out:Ljava/io/OutputStream;

    .line 27
    return-void
.end method


# virtual methods
.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/ning/http/client/multipart/OutputStreamPartVisitor;->out:Ljava/io/OutputStream;

    return-object v0
.end method

.method public withByte(B)V
    .locals 1
    .param p1, "b"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    iget-object v0, p0, Lcom/ning/http/client/multipart/OutputStreamPartVisitor;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 37
    return-void
.end method

.method public withBytes([B)V
    .locals 1
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 31
    iget-object v0, p0, Lcom/ning/http/client/multipart/OutputStreamPartVisitor;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 32
    return-void
.end method
