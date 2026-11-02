.class final Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;
.super Ljava/lang/Object;
.source "DefaultHttpHeaders.java"

# interfaces
.implements Ljava/util/Map$Entry;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
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
.field after:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

.field before:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

.field final hash:I

.field final key:Ljava/lang/String;

.field next:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

.field final synthetic this$0:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;

.field value:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p2, "hash"    # I
    .param p3, "key"    # Ljava/lang/String;
    .param p4, "value"    # Ljava/lang/String;

    .prologue
    .line 436
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->this$0:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 437
    iput p2, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->hash:I

    .line 438
    iput-object p3, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->key:Ljava/lang/String;

    .line 439
    iput-object p4, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->value:Ljava/lang/String;

    .line 440
    return-void
.end method


# virtual methods
.method addBefore(Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;)V
    .locals 1
    .param p1, "e"    # Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    .prologue
    .line 448
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    .line 449
    iget-object v0, p1, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->before:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->before:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    .line 450
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->before:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iput-object p0, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    .line 451
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iput-object p0, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->before:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    .line 452
    return-void
.end method

.method public bridge synthetic getKey()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 429
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->getKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 455
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->key:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic getValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 429
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 459
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->value:Ljava/lang/String;

    return-object v0
.end method

.method remove()V
    .locals 2

    .prologue
    .line 443
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->before:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iput-object v1, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    .line 444
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->before:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iput-object v1, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->before:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    .line 445
    return-void
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 429
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->setValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 463
    if-nez p1, :cond_0

    .line 464
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "value"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 466
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->this$0:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;

    iget-boolean v1, v1, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->validate:Z

    if-eqz v1, :cond_1

    .line 467
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->this$0:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;

    invoke-virtual {v1, p1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->validateHeaderValue0(Ljava/lang/String;)V

    .line 469
    :cond_1
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->value:Ljava/lang/String;

    .line 470
    .local v0, "oldValue":Ljava/lang/String;
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->value:Ljava/lang/String;

    .line 471
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 476
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
