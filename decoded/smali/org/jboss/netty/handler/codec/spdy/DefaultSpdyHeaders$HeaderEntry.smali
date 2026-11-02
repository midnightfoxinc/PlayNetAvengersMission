.class final Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;
.super Ljava/lang/Object;
.source "DefaultSpdyHeaders.java"

# interfaces
.implements Ljava/util/Map$Entry;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "HeaderEntry"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Map$Entry",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field after:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

.field before:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

.field final hash:I

.field final key:Ljava/lang/String;

.field next:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

.field value:Ljava/lang/String;


# direct methods
.method constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "hash"    # I
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 335
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 336
    iput p1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->hash:I

    .line 337
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->key:Ljava/lang/String;

    .line 338
    iput-object p3, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->value:Ljava/lang/String;

    .line 339
    return-void
.end method


# virtual methods
.method addBefore(Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;)V
    .locals 1
    .param p1, "e"    # Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    .prologue
    .line 347
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    .line 348
    iget-object v0, p1, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->before:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->before:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    .line 349
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->before:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    iput-object p0, v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    .line 350
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    iput-object p0, v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->before:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    .line 351
    return-void
.end method

.method public bridge synthetic getKey()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 328
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->getKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 355
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->key:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic getValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 328
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 360
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->value:Ljava/lang/String;

    return-object v0
.end method

.method remove()V
    .locals 2

    .prologue
    .line 342
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->before:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    iput-object v1, v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    .line 343
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->before:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    iput-object v1, v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->before:Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;

    .line 344
    return-void
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 328
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->setValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 365
    if-nez p1, :cond_0

    .line 366
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "value"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 368
    :cond_0
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->validateHeaderValue(Ljava/lang/String;)V

    .line 369
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->value:Ljava/lang/String;

    .line 370
    .local v0, "oldValue":Ljava/lang/String;
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->value:Ljava/lang/String;

    .line 371
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 376
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders$HeaderEntry;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
