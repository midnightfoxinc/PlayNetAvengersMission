.class Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$4;
.super Ljava/util/ArrayList;
.source "EMTPortalLibraryController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->handleDRTCommandWithSimpleData(SI[B)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

.field final synthetic val$timestamp:Ljava/lang/Integer;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;Ljava/lang/Integer;)V
    .locals 1
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .prologue
    .line 2088
    iput-object p1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$4;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    iput-object p2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$4;->val$timestamp:Ljava/lang/Integer;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$4;->val$timestamp:Ljava/lang/Integer;

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$4;->add(Ljava/lang/Object;)Z

    return-void
.end method
