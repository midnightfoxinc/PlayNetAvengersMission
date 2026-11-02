.class final Lcom/disneymobile/mocha/support/CollectionUtil$1;
.super Ljava/lang/Object;
.source "CollectionUtil.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disneymobile/mocha/support/CollectionUtil;->asIterable(Ljava/util/Iterator;)Ljava/lang/Iterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<TX;>;"
    }
.end annotation


# instance fields
.field final synthetic val$iterator:Ljava/util/Iterator;


# direct methods
.method constructor <init>(Ljava/util/Iterator;)V
    .locals 0

    .prologue
    .line 124
    iput-object p1, p0, Lcom/disneymobile/mocha/support/CollectionUtil$1;->val$iterator:Ljava/util/Iterator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TX;>;"
        }
    .end annotation

    .prologue
    .line 130
    iget-object v0, p0, Lcom/disneymobile/mocha/support/CollectionUtil$1;->val$iterator:Ljava/util/Iterator;

    return-object v0
.end method
