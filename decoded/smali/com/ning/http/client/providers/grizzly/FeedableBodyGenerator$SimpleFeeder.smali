.class public abstract Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$SimpleFeeder;
.super Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;
.source "FeedableBodyGenerator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "SimpleFeeder"
.end annotation


# direct methods
.method public constructor <init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)V
    .locals 0
    .param p1, "feedableBodyGenerator"    # Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;

    .prologue
    .line 630
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator$BaseFeeder;-><init>(Lcom/ning/http/client/providers/grizzly/FeedableBodyGenerator;)V

    .line 631
    return-void
.end method
