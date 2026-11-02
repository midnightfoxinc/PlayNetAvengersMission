.class final Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderIterator;
.super Ljava/lang/Object;
.source "DefaultHttpHeaders.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "HeaderIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Ljava/util/Map$Entry",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# instance fields
.field private current:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

.field final synthetic this$0:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;


# direct methods
.method private constructor <init>(Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;)V
    .locals 1

    .prologue
    .line 406
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderIterator;->this$0:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 408
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderIterator;->this$0:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;

    invoke-static {v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->access$100(Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;)Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderIterator;->current:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    return-void
.end method

.method synthetic constructor <init>(Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;
    .param p2, "x1"    # Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$1;

    .prologue
    .line 406
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderIterator;-><init>(Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;)V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 411
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderIterator;->current:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderIterator;->this$0:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;

    invoke-static {v1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->access$100(Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;)Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    move-result-object v1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 406
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderIterator;->next()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/util/Map$Entry;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 415
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderIterator;->current:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;->after:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderIterator;->current:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    .line 417
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderIterator;->current:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderIterator;->this$0:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;

    invoke-static {v1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;->access$100(Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;)Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 418
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 421
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderIterator;->current:Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders$HeaderEntry;

    return-object v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 425
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
