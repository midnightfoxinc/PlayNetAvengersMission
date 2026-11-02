.class Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;
.super Lcom/disneymobile/mocha/NSPropertyListSerialization$BaseHandler;
.source "NSPropertyListSerialization.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disneymobile/mocha/NSPropertyListSerialization;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ArrayHandler"
.end annotation


# static fields
.field private static final ELEMENT_DATA:I = 0x5

.field private static final ELEMENT_FALSE:I = 0x3

.field private static final ELEMENT_INTEGER:I = 0x0

.field private static final ELEMENT_REAL:I = 0x2

.field private static final ELEMENT_STRING:I = 0x1

.field private static final ELEMENT_TRUE:I = 0x4

.field private static final ELEMENT_UNKNOWN:I = -0x1


# instance fields
.field private array:Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;

.field private currentValue:Ljava/lang/StringBuilder;

.field private element:I


# direct methods
.method public constructor <init>(Lcom/disneymobile/mocha/support/ChainedHandler;)V
    .locals 2
    .param p1, "parent"    # Lcom/disneymobile/mocha/support/ChainedHandler;

    .prologue
    const/4 v1, 0x0

    .line 474
    invoke-direct {p0, p1}, Lcom/disneymobile/mocha/NSPropertyListSerialization$BaseHandler;-><init>(Lcom/disneymobile/mocha/support/ChainedHandler;)V

    .line 464
    iput-object v1, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->currentValue:Ljava/lang/StringBuilder;

    .line 465
    const/4 v0, -0x1

    iput v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->element:I

    .line 475
    new-instance v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;

    invoke-direct {v0, v1}, Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;-><init>(Lcom/disneymobile/mocha/NSPropertyListSerialization$1;)V

    iput-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->array:Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;

    .line 476
    return-void
.end method

.method public constructor <init>(Lorg/xml/sax/XMLReader;)V
    .locals 1
    .param p1, "reader"    # Lorg/xml/sax/XMLReader;

    .prologue
    .line 470
    invoke-direct {p0, p1}, Lcom/disneymobile/mocha/NSPropertyListSerialization$BaseHandler;-><init>(Lorg/xml/sax/XMLReader;)V

    .line 464
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->currentValue:Ljava/lang/StringBuilder;

    .line 465
    const/4 v0, -0x1

    iput v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->element:I

    .line 471
    return-void
.end method


# virtual methods
.method public addChild(Ljava/lang/Object;)V
    .locals 1
    .param p1, "child"    # Ljava/lang/Object;

    .prologue
    .line 558
    iget-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->array:Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;

    iget-object v0, v0, Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;->children:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 559
    return-void
.end method

.method public characters([CII)V
    .locals 1
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 505
    iget v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->element:I

    packed-switch v0, :pswitch_data_0

    .line 515
    :goto_0
    :pswitch_0
    return-void

    .line 510
    :pswitch_1
    iget-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->currentValue:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 505
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 519
    const-string v6, "integer"

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 520
    iget-object v6, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->currentValue:Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 523
    .local v5, "value":Ljava/lang/String;
    :try_start_0
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    .line 528
    .local v4, "intValue":I
    :goto_0
    iget-object v6, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->array:Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;

    iget-object v6, v6, Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;->children:Ljava/util/ArrayList;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 554
    .end local v4    # "intValue":I
    .end local v5    # "value":Ljava/lang/String;
    :cond_0
    :goto_1
    return-void

    .line 524
    .restart local v5    # "value":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 525
    .local v1, "e":Ljava/lang/NumberFormatException;
    const-string v6, "NSPropertyListSerializable.ArrayHandler"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "A value in an integer element is not an integer: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 526
    const/4 v4, 0x0

    .restart local v4    # "intValue":I
    goto :goto_0

    .line 529
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    .end local v4    # "intValue":I
    .end local v5    # "value":Ljava/lang/String;
    :cond_1
    const-string v6, "string"

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 530
    iget-object v6, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->array:Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;

    iget-object v6, v6, Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;->children:Ljava/util/ArrayList;

    iget-object v7, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->currentValue:Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 531
    :cond_2
    const-string v6, "real"

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 532
    iget-object v6, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->currentValue:Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 535
    .restart local v5    # "value":Ljava/lang/String;
    :try_start_1
    invoke-static {v5}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-wide v2

    .line 540
    .local v2, "doubleValue":D
    :goto_2
    iget-object v6, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->array:Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;

    iget-object v6, v6, Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;->children:Ljava/util/ArrayList;

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 536
    .end local v2    # "doubleValue":D
    :catch_1
    move-exception v1

    .line 537
    .restart local v1    # "e":Ljava/lang/NumberFormatException;
    const-string v6, "NSPropertyListSerializable.ArrayHandler"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "A value in a real element is not a double: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 538
    const-wide/16 v2, 0x0

    .restart local v2    # "doubleValue":D
    goto :goto_2

    .line 541
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    .end local v2    # "doubleValue":D
    .end local v5    # "value":Ljava/lang/String;
    :cond_3
    const-string v6, "true"

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 542
    iget-object v6, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->array:Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;

    iget-object v6, v6, Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;->children:Ljava/util/ArrayList;

    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 543
    :cond_4
    const-string v6, "false"

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 544
    iget-object v6, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->array:Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;

    iget-object v6, v6, Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;->children:Ljava/util/ArrayList;

    sget-object v7, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 545
    :cond_5
    const-string v6, "data"

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 546
    iget-object v6, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->currentValue:Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/disneymobile/mocha/support/Base64Coder;->decode(Ljava/lang/String;)[B

    move-result-object v0

    .line 547
    .local v0, "data":[B
    iget-object v6, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->array:Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;

    iget-object v6, v6, Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;->children:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/disneymobile/mocha/NSData;->dataWithBytesNoCopy([B)Lcom/disneymobile/mocha/NSData;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 548
    .end local v0    # "data":[B
    :cond_6
    const-string v6, "array"

    invoke-virtual {v6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 549
    const-class v6, Lcom/disneymobile/mocha/NSPropertyListSerialization$BaseHandler;

    iget-object v7, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->mParent:Lcom/disneymobile/mocha/support/ChainedHandler;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 550
    iget-object v6, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->mParent:Lcom/disneymobile/mocha/support/ChainedHandler;

    check-cast v6, Lcom/disneymobile/mocha/NSPropertyListSerialization$BaseHandler;

    iget-object v7, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->array:Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;

    iget-object v7, v7, Lcom/disneymobile/mocha/NSPropertyListSerialization$Array;->children:Ljava/util/ArrayList;

    invoke-virtual {v6, v7}, Lcom/disneymobile/mocha/NSPropertyListSerialization$BaseHandler;->addChild(Ljava/lang/Object;)V

    .line 552
    :cond_7
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->stopHandlingEvents()V

    goto/16 :goto_1
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "attr"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 480
    invoke-super {p0, p1, p2, p3, p4}, Lcom/disneymobile/mocha/NSPropertyListSerialization$BaseHandler;->startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 482
    const-string v0, "integer"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 483
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->currentValue:Ljava/lang/StringBuilder;

    .line 484
    const/4 v0, 0x0

    iput v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->element:I

    .line 501
    :goto_0
    return-void

    .line 485
    :cond_0
    const-string v0, "string"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 486
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->currentValue:Ljava/lang/StringBuilder;

    .line 487
    const/4 v0, 0x1

    iput v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->element:I

    goto :goto_0

    .line 488
    :cond_1
    const-string v0, "real"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 489
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->currentValue:Ljava/lang/StringBuilder;

    .line 490
    const/4 v0, 0x2

    iput v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->element:I

    goto :goto_0

    .line 491
    :cond_2
    const-string v0, "false"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 492
    const/4 v0, 0x3

    iput v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->element:I

    goto :goto_0

    .line 493
    :cond_3
    const-string v0, "true"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 494
    const/4 v0, 0x4

    iput v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->element:I

    goto :goto_0

    .line 495
    :cond_4
    const-string v0, "data"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 496
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->currentValue:Ljava/lang/StringBuilder;

    .line 497
    const/4 v0, 0x5

    iput v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->element:I

    goto :goto_0

    .line 499
    :cond_5
    const/4 v0, -0x1

    iput v0, p0, Lcom/disneymobile/mocha/NSPropertyListSerialization$ArrayHandler;->element:I

    goto :goto_0
.end method
