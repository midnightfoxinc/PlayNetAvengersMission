.class final Lcom/disneymobile/mocha/Utilities$1;
.super Ljava/lang/Object;
.source "Utilities.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disneymobile/mocha/Utilities;->sortedArrayUsingSelector(Ljava/util/Set;Lcom/disneymobile/mocha/support/Selector;)[Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$selector:Lcom/disneymobile/mocha/support/Selector;


# direct methods
.method constructor <init>(Lcom/disneymobile/mocha/support/Selector;)V
    .locals 0

    .prologue
    .line 138
    iput-object p1, p0, Lcom/disneymobile/mocha/Utilities$1;->val$selector:Lcom/disneymobile/mocha/support/Selector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 5
    .param p1, "lhs"    # Ljava/lang/Object;
    .param p2, "rhs"    # Ljava/lang/Object;

    .prologue
    .line 140
    iget-object v1, p0, Lcom/disneymobile/mocha/Utilities$1;->val$selector:Lcom/disneymobile/mocha/support/Selector;

    const/4 v2, 0x0

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    invoke-virtual {v1, v2, p1, v3}, Lcom/disneymobile/mocha/support/Selector;->invokeWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 141
    .local v0, "result":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1
.end method
