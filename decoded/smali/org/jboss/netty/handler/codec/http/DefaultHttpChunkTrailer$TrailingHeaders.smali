.class final Lorg/jboss/netty/handler/codec/http/DefaultHttpChunkTrailer$TrailingHeaders;
.super Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;
.source "DefaultHttpChunkTrailer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/http/DefaultHttpChunkTrailer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TrailingHeaders"
.end annotation


# direct methods
.method constructor <init>(Z)V
    .locals 0
    .param p1, "validateHeaders"    # Z

    .prologue
    .line 72
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;-><init>(Z)V

    .line 73
    return-void
.end method

.method private static validateName(Ljava/lang/String;)V
    .locals 3
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 108
    const-string v0, "Content-Length"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Transfer-Encoding"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Trailer"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 111
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "prohibited trailing header: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 114
    :cond_1
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable",
            "<*>;)",
            "Lorg/jboss/netty/handler/codec/http/HttpHeaders;"
        }
    .end annotation

    .prologue
    .line 85
    .local p2, "values":Ljava/lang/Iterable;, "Ljava/lang/Iterable<*>;"
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunkTrailer$TrailingHeaders;->validate:Z

    if-eqz v0, :cond_0

    .line 86
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunkTrailer$TrailingHeaders;->validateName(Ljava/lang/String;)V

    .line 88
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->add(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    return-object v0
.end method

.method public add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 77
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunkTrailer$TrailingHeaders;->validate:Z

    if-eqz v0, :cond_0

    .line 78
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunkTrailer$TrailingHeaders;->validateName(Ljava/lang/String;)V

    .line 80
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    return-object v0
.end method

.method public set(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable",
            "<*>;)",
            "Lorg/jboss/netty/handler/codec/http/HttpHeaders;"
        }
    .end annotation

    .prologue
    .line 93
    .local p2, "values":Ljava/lang/Iterable;, "Ljava/lang/Iterable<*>;"
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunkTrailer$TrailingHeaders;->validate:Z

    if-eqz v0, :cond_0

    .line 94
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunkTrailer$TrailingHeaders;->validateName(Ljava/lang/String;)V

    .line 96
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->set(Ljava/lang/String;Ljava/lang/Iterable;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    return-object v0
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 101
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunkTrailer$TrailingHeaders;->validate:Z

    if-eqz v0, :cond_0

    .line 102
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunkTrailer$TrailingHeaders;->validateName(Ljava/lang/String;)V

    .line 104
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    return-object v0
.end method
