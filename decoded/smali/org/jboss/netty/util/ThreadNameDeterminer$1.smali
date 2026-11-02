.class final Lorg/jboss/netty/util/ThreadNameDeterminer$1;
.super Ljava/lang/Object;
.source "ThreadNameDeterminer.java"

# interfaces
.implements Lorg/jboss/netty/util/ThreadNameDeterminer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/util/ThreadNameDeterminer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public determineThreadName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p1, "currentThreadName"    # Ljava/lang/String;
    .param p2, "proposedThreadName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 30
    return-object p2
.end method
