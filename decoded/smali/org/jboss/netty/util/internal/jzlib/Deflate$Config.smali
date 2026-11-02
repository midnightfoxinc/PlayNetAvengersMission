.class final Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;
.super Ljava/lang/Object;
.source "Deflate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/util/internal/jzlib/Deflate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Config"
.end annotation


# instance fields
.field final func:I

.field final good_length:I

.field final max_chain:I

.field final max_lazy:I

.field final nice_length:I


# direct methods
.method constructor <init>(IIIII)V
    .locals 0
    .param p1, "good_length"    # I
    .param p2, "max_lazy"    # I
    .param p3, "nice_length"    # I
    .param p4, "max_chain"    # I
    .param p5, "func"    # I

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput p1, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;->good_length:I

    .line 64
    iput p2, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;->max_lazy:I

    .line 65
    iput p3, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;->nice_length:I

    .line 66
    iput p4, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;->max_chain:I

    .line 67
    iput p5, p0, Lorg/jboss/netty/util/internal/jzlib/Deflate$Config;->func:I

    .line 68
    return-void
.end method
